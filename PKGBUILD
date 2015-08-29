# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=sqlitexx
pkgver=0.0.3
pkgrel=4
pkgdesc="A C++ API for Sqlite."
arch=('i686' 'x86_64')
url='http://wiki.github.com/andreasbaumann/sqlitexx/'
license=('LGPL')
makedepends=('sqlite3>=3.0' 'doxygen')
depends=('sqlite3>=3.0')
provides=('sqlitexx')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
source=(http://github.com/downloads/andreasbaumann/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('85bda2872260213c8e336c0a98e451dd')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make || return 1
  make doc || return 1
  make DESTDIR=${pkgdir} install || return 1
}
