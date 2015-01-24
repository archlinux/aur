# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.1.0
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library"
url='http://git.kolab.org/libkolabxml/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'qt4' 'swig')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
md5sums=('a7166537c869ec065613f6b15a3ab86a'
         'f49d02ddaf1fa0f708e9190addef5ab6')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
