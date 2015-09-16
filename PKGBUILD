# Maintainer: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python-peewee
pkgver=2.6.3
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
source=(http://pypi.python.org/packages/source/p/peewee/peewee-$pkgver.tar.gz)
sha256sums=('2918d416f75665ba222810fe99ec571d7d0c9c21b37d02101bdf2ddaf13c42a2')

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
