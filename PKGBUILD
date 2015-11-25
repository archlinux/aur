# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.1.2
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library"
url='http://git.kolab.org/libkolabxml/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'swig')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
md5sums=('f9840fe0c8f5e32312cc3fc3e9b982a5'
         '1d265643086c58564758add8e5eb72c7')

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
