# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=0.8.1
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library"
url='http://git.kolab.org/libkolabxml/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
md5sums=('a02541b35153334c69ee1845dfe464c6'
         'f5e9bc4a21a5bf06baec084435812cc4')

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
