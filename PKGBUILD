# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=sqlitexx
pkgver=0.0.4
pkgrel=2
pkgdesc="A C++ API for Sqlite."
arch=('i686' 'x86_64')
url='http://wiki.github.com/andreasbaumann/sqlitexx/'
license=('LGPL')
makedepends=('sqlite3>=3.0' 'doxygen')
depends=('sqlite3>=3.0')
provides=('sqlitexx')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('41ecee2d76247f432454bc48fc5f069e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make
  make doc
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make test
}
