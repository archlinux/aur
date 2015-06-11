# Maintainer: Erhan SAHIN <erhan@ssahin.net> 

pkgname=python2-sqlalchemy-kilo
pkgver=0.9.9
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org/"
license=('MIT')
makedepends=('python2')
source=("https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
pkgdesc='Python 2 SQL toolkit and Object Relational Mapper'
depends=('python2')
provides=('python2-sqlalchemy')
conflicts=('python2-sqlalchemy')
md5sums=('8a10a9bd13ed3336ef7333ac2cc679ff')

build() {
  cd ${srcdir}/SQLAlchemy-$pkgver
  python2 setup.py build
}

check() {
  cd SQLAlchemy-${pkgver}
  python2 setup.py check
}

package() {
  cd SQLAlchemy-$pkgver
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
