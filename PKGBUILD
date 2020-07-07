# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=1.18.0
pkgrel=1
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('qt5-base'
         'hicolor-icon-theme')
makedepends=('cmake' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/juzzlin/Heimer/archive/${pkgver}.tar.gz")
sha256sums=('64be470504ffee1ce801dd05a0eb6e3a8d487c87be36ede4bfd2ce1f307fa664')

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