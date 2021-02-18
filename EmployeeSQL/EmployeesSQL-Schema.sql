DROP TABLE if exists titles CASCADE;
DROP TABLE if exists employees CASCADE;
DROP TABLE if exists departments CASCADE;
DROP TABLE if exists dept_emp CASCADE;
DROP TABLE if exists dept_manager CASCADE;
DROP TABLE if exists salaries CASCADE;

-- to create the tables as referenced in ERD/schema

CREATE TABLE titles (
	title_id varchar(13) PRIMARY KEY not null,
	title varchar(113) not null
);



CREATE TABLE employees (
	emp_no int PRIMARY KEY not null,
	emp_title_id varchar(13) not null,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id),
	birth_date date not null,
	first_name varchar(33) not null,
	last_name varchar(33) not null,
	sex varchar(3) not null,
	hire_date date not null
);



CREATE TABLE departments (
	dept_no varchar(13) PRIMARY KEY not null,
	dept_name varchar(113) not null
);



CREATE TABLE dept_emp (
	emp_no int not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no varchar(13) not null,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);



CREATE TABLE dept_manager (
	dept_no varchar(13) not null,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no int not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);



CREATE TABLE salaries (
	emp_no int PRIMARY KEY not null,
	foreign key (emp_no) references employees(emp_no),
	salary int not null
);

-- to view the loaded data, selecting all items from the tables

select * from titles;

select * from employees;

select * from departments;

select * from dept_emp;

select * from dept_manager;

select * from salaries;

