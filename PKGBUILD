# Maintainer: juantascon
# Submitter: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: sevkin

pkgname=python2-peewee
pkgver=2.5.1
pkgrel=2
pkgdesc="a little orm"
url="https://pypi.python.org/pypi/peewee/"
arch=('any')
license=('MIT')
depends=('python2')
optdepends=('python2-psycopg2' 'mysql-python')
source=(http://pypi.python.org/packages/source/p/peewee/peewee-$pkgver.tar.gz)

build() {
  cd $srcdir/peewee-$pkgver
  python2 setup.py build
}

package() {

  cd $srcdir/peewee-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -D -m644 README.rst $pkgdir/usr/share/$pkgname/README.rst
  install -D -m644 TODO.rst $pkgdir/usr/share/$pkgname/TODO.rst
  cd $pkgdir/usr/bin
  mv pwiz.py pwiz.py-python2

}

sha1sums=('391c45e480e36ace9128c282d1ed068d505f9a3c')
