# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>
# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=log4cplus
_origver=1.2.0-rc5
pkgver=1.2.0rc5
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('i686' 'x86_64' 'armv7h')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${_origver}.tar.xz")
sha256sums=('224d149691fc75ae36875855be3f487d7de301a04d7b5bd2929ef7c35a91d256')

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
