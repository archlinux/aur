# Contributor: Kozec <kozec.at.kozec.dot.com>

pkgname=python-sqlparse-git
pkgver=0.1.9.27.geebde5b
pkgrel=1
pkgdesc="Non-validating SQL parser for Python. Git version"
arch=(i686 x86_64)
url="http://code.google.com/p/python-sqlparse/"
license=('BSD')
depends=('python2')
source=("git+https://github.com/andialbrecht/sqlparse.git")

provides=('python-sqlparse')
conflicts=('python-sqlparse')
replaces=('python-sqlparse')
sha256sums=('SKIP')

pkgver() {
    cd sqlparse
    git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd $srcdir/sqlparse
  python2.7 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}


