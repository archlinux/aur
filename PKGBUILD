# $Id: $
# Maintainer:
# Contributor: 

pkgname=reiserfs-defrag
pkgver=0.2.2
pkgrel=1
pkgdesc="Offline defragmenter for reiserfs. Experimental. Do not use it on sensitive data."
arch=('i686' 'x86_64')
url="https://github.com/i-rinat/reiserfs-defrag"
license=('GPL')
depends=('gcc-libs')
#source=(https://github.com/downloads/i-rinat/reiserfs-defrag/${pkgname}-v${pkgver}.tar.xz)
source=(https://github.com/i-rinat/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('28fc7fe7373fab0e90f74acaf2fbfcf2578f7b04eeadcecb50f88bee2b67e718')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release .. -DCMAKE_INSTALL_PREFIX=/usr -DSBINDIR=/usr/bin
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make install DESTDIR="${pkgdir}"
}
