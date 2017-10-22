# Maintainer: geigi <aur@geigi.de>

pkgname=python3-peewee
pkgver=2.10.2
pkgrel=1
pkgdesc="a little orm"
url="https://pypi.python.org/pypi/peewee/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=(
	'python-psycopg2: for PostgreSQL database support'
	'mysql-python: for MySQL database support'
	'python-pymysql: for MySQL database support'
	)
source=(https://github.com/coleifer/peewee/archive/$pkgver.tar.gz)
sha256sums=('SKIP')

build() {
  cd $srcdir/peewee-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/peewee-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -D -m644 README.rst $pkgdir/usr/share/$pkgname/README.rst
  install -D -m644 TODO.rst $pkgdir/usr/share/$pkgname/TODO.rst
}
