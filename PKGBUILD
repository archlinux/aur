# Contributor: Kozec <kozec.at.kozec.dot.com>

pkgname=python-sqlparse-git
pkgver=0.3.0.22.g338914c
pkgrel=1
pkgdesc="Non-validating SQL parser for Python. Git version"
arch=(i686 x86_64)
url="https://github.com/andialbrecht/sqlparse"
license=('BSD')
depends=('python' 'python-setuptools')
source=("git+https://github.com/andialbrecht/sqlparse.git")

provides=('python-sqlparse')
conflicts=('python-sqlparse')
replaces=('python-sqlparse')
sha256sums=('SKIP')

pkgver() {
    cd sqlparse
    git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

package() {
  cd $srcdir/sqlparse
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}


