# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=0.8.4
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library"
url='http://git.kolab.org/libkolabxml/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'qt4')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
md5sums=('64887f52c6629bbd8e2390d591ef5892'
         '55fcdaff82818c4a0eac50570db31e53')

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
