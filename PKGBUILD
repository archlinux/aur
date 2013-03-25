# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=0.8.3
pkgrel=2
pkgdesc="Kolab XML Format Schema Definitions Library"
url='http://git.kolab.org/libkolabxml/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'qt4')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
md5sums=('38ded7003255decf9cd46c6a3f442e6b'
         '493a9fcca56a244fc7403e4131cf7d5f')

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
