# Maintainer: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=1.17.0
pkgrel=1
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('qt5-tools')
makedepends=('cmake' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/juzzlin/Heimer/archive/${pkgver}.tar.gz")
sha256sums=('252487933f7ba12348e6bc215b4679b83314440caa991a667dba06b3e929a74c')

build() {
	cd "Heimer-${pkgver}"
  rm -rf build
	mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	cd "Heimer-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
}