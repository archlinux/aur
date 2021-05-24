# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=('python-sql' 'python2-sql')
pkgver=1.2.2
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=('any')
url="http://python-sql.tryton.org/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/p/python-sql/python-sql-$pkgver.tar.gz")
sha256sums=('2d916357a0172c35eccac29064cd18cd41616fc60109a37dac0e9d11a0b1183a')

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
