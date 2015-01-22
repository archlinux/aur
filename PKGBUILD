# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Yejun Yang <yejunx AT gmail DOT com>

pkgname=python2-dbutils
pkgver=1.1
pkgrel=2
pkgdesc="DBUtils is a suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database. "
url="http://www.webwareforpython.org/DBUtils"
license=(Open Software License)
depends=('python2')
arch=('any')
source=(http://www.w4py.org/downloads/DBUtils/DBUtils-$pkgver.tar.gz LICENSE)
sha256sums=('d62d1abaafdbd9245a53e9c901f4162125d0258ef8a489233dba4689cea0bff7'
            '4eeb837027209bbf68895f1461cafe1fb1817a8d1b5702dbee3b8c6ea42a9b9b')

build() {
  cd "$srcdir/DBUtils-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/DBUtils-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir"
  install -Dm0644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
