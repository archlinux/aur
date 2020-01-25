# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=('python-sql' 'python2-sql')
pkgver=1.1.0
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=('any')
url="http://python-sql.tryton.org/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/p/python-sql/python-sql-$pkgver.tar.gz")
sha256sums=('bfb73b325ac5e4bd7605ea07ad575f1499e6c93ada65b03dea6a430e3c080f38')

prepare() {
  cp -a python-sql-$pkgver{,-py2}
}

build() {
  cd "$srcdir/python-sql-$pkgver"
  python setup.py build

  cd "$srcdir/python-sql-$pkgver-py2"
  python2 setup.py build
}

package_python-sql() {
    cd "$srcdir/python-sql-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-sql() {
    cd "$srcdir/python-sql-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
