# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit.com >

pkgname=dmtx-utils
pkgver=0.7.4
pkgrel=1
pkgdesc="Utilities to libdmtx"
url="http://www.libdmtx.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libdmtx')
source=("http://downloads.sourceforge.net/libdmtx/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('e56990bf058c109206124f8d9177715b7675e657')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
