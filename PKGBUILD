# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=0.8.1
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library"
url='http://git.kolab.org/libkolabxml/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'uuid' 'xsd')
makedepends=('cmake')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
md5sums=('c30a876fed5e42feb33794b3c093a8a2'
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
