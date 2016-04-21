(defparameter data1 nil)
(defparameter data2 nil)
(let ( (file1 (open "file1.txt")) (file2 (open "file2.txt")) )
	(when file1 
      		(loop for line1 = (read-line file1 nil)
            		while line1 do 
				(push line1 data1)
		)
	)
	(when file2 
      		(loop for line2 = (read-line file2 nil)
            		while line2 do
            			(push line2 data2)
		)
	)
(close file1))

(setf data1 (reverse data1))
(setf data2 (reverse data2))

(defparameter bool 'f)
(loop for temp1 in data1
	while temp1 do 
	(loop for temp2 in data2
		while temp2 do
		(setf bool 'f)
		(cond
			((equal temp1 temp2)
				(loop for temp3 in data2
					while temp3 do
					(if (equal temp2 (car data2)) (return) ())
					(format t "~c[34m + ~a ~c[0m ~%" #\ESC (car data2) #\ESC )
					(setf data2 (remove (car data2) data2 :count 1))	
				)
				(format t "   ~a~%" temp2)
				(setf data2 (remove temp2 data2 :count 1))
				(setf bool 't)
				(return)
			)
		)			
	)
	(cond ( (equal bool 'f)  (format t "~c[31m - ~a ~c[0m ~%" #\ESC temp1 #\ESC) ))	
)
(loop for temp2 in data2
	while temp2 do
	(format t "~c[34m + ~a ~c[0m ~%" #\ESC (car data2) #\ESC )	
	(setf data2 (remove (car data2) data2 :count 1))
)
























