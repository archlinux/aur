# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=1.21.0
pkgrel=1
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('hicolor-icon-theme'
         'qt5-svg')
makedepends=('cmake' 'qt5-base' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/juzzlin/Heimer/archive/${pkgver}.tar.gz")
sha256sums=('3ec106b3b30cdbe04adcea37981c9214325a0aa92f2fae2df0bc12c95146434f')

build() {
  cd "Heimer-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. 
}

package() {
  cd "Heimer-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
