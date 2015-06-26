# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>
# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=log4cplus
_origver=1.2.0-rc2
pkgver=1.2.0rc2
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('i686' 'x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${_origver}.tar.xz")
sha256sums=('b4cebe31af5c6dffcf511e17e8838c6f537bb673b3d0264d37c0514baf43189d')

package() {
  cd ${srcdir}/${pkgname}-${_origver}

  make install DESTDIR=$pkgdir
}

build() {
  cd ${srcdir}/${pkgname}-${_origver}

  ./configure \
    --prefix=/usr \
    --with-working-locale

  make
}
