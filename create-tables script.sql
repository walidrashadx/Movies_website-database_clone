CREATE TABLE actor (
	act_id		int			NOT NULL,
	act_fname	char(20)	NULL,
	act_lname	char(20)	NULL,
	act_gender	char(1)		NULL,
	CONSTRAINT Actor_Pk		primary key(act_id)
);

CREATE TABLE director (
	dir_id		int			NOT NULL,
    dir_fname	char(20)	NULL,
    dir_lname	char(20)	NULL,
    CONSTRAINT Director_PK 	primary key(dir_id)
);

CREATE TABLE movie (
	mov_id				int			NOT NULL,
    mov_title			CHAR(50)	NULL,
    mov_year			int			NULL,
	mov_time			int			NULL,
	mov_lang			CHAR(50)	NULL,
	mov_dt_rel			date		NULL,
	mov_rel_country		CHAR(50)	NULL,
    CONSTRAINT	Movie_PK	primary key(mov_id)
);

CREATE TABLE movie_cast (
	act_id		int			NOT NULL,
    mov_id		int			NOT NULL,
    role		char(30)	NULL,
    CONSTRAINT movie_cast_PK	primary key(act_id, mov_id),
    CONSTRAINT movie_cast_FK		foreign key(act_id)
			REFERENCES	actor(act_id),
	CONSTRAINT MovieCast_FK		foreign key(mov_id)
			REFERENCES movie(mov_id)
);

CREATE TABLE movie_direction (
	dir_id		int		NOT NULL,
    mov_id		int		NOT NULL,
    CONSTRAINT	movie_direction_PK	primary key(dir_id, mov_id),
    CONSTRAINT	movie_direction_FK	foreign key(dir_id)
			REFERENCES	director(dir_id),
	CONSTRAINT MovieDirection_FK	foreign key(mov_id)
			REFERENCES	movie(mov_id)
);

CREATE TABLE genres (
	gen_id			int			NOT NULL,
	gen_title		char(20)	NULL,
    CONSTRAINT genres_PK 	primary key(gen_id)
);

CREATE TABLE movie_genres (
	mov_id		int			NOT NULL,
    gen_id		int			NOT NULL,
    CONSTRAINT movie_genres_PK	primary key(mov_id, gen_id),
	CONSTRAINT movie_genres_FK	foreign key(mov_id)
			REFERENCES	movie(mov_id),
	CONSTRAINT MovieGenres_FK	foreign key(gen_id)
		references Genres(gen_id)
);

CREATE TABLE reviewer (
	rev_id		int			NOT NULL,
	rev_name	char(30)	NULL,
    CONSTRAINT	reviewer_PK	primary key(rev_id)
);

CREATE TABLE rating (
	mov_id			int		NOT NULL,
    rev_id			int		NOT NULL,
    rev_stars		int		NOT NULL,
    num_o_ratings	int		NOT NULL,
    CONSTRAINT		rating_PK	primary key(mov_id, rev_id),
    CONSTRAINT		rating_FK	foreign key(mov_id)
			REFERENCES movie(mov_id),
	CONSTRAINT		Ratings_FK	foreign key(rev_id)
			REFERENCES reviewer(rev_id)
);