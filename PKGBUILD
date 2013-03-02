# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=crunchyfrog-hg
pkgver=699
pkgrel=1
pkgdesc="SQL editor and database schema browser for the GNOME desktop, latest development version"
url='http://code.google.com/p/crunchyfrog'
arch=('any')
license=('GPL3')
depends=('python2' 'python-configobj' 'pygtk' 'pygtksourceview2' 'pycairo' \
         'pyxdg' 'gnome-python' 'gnome-python-desktop' \
		 'python-sphinx')
optdepends=('mysql-python:  To handle MySQL Databases',
            'python-psycopg2:   To handle PostgreSQL Databases',
            'python-pysqlite:   To handle SQLite Databases',
            'cx_oracle: To handle Oracle Databases (just for i686)',
            'pymssql:   To handle Microsoft SQL Server Databases',
            'kinterbasdb:   To handle Firebird Databases'
            'informixdb: To handle Informix Databases'
            'sapdb: To handle MaxDB'
            'ipython: To use built-in python shell'
           )
makedepends=('mercurial')
provides=('crunchyfrog')
conflicts=('crunchyfrog')
source=()
md5sums=()
sha256sums=()

_hgroot="https://crunchyfrog.googlecode.com/hg"
_hgrepo="crunchyfrog"

build() {
    cd ${srcdir}/${_hgrepo}

	# remove all language files except English since the language is wrong otherwise
	rm -r po/{cs,da,de,el,es,fi,fr,he,id,it,ja,nl,ru,sv,tr}

	python setup.py install --root=${pkgdir}/ --optimize=1 || return 1
}
