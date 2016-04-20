# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=sjaakii
pkgver=1.3.0
pkgrel=2
pkgdesc="A XBoard chess engine that can play normal chess as well as a number of other games and chess variants"
arch=('i686' 'x86_64')
url="http://www.eglebbk.dds.nl/program/chess-index.html"
license=('GPL3')
depends=('readline')
makedepends=('cmake')
source=("http://www.eglebbk.dds.nl/program/download/${pkgname}-${pkgver}-src.tar.gz")
md5sums=('dc9a182bd7470758b3d834fbb6e22163')

build() {
  cd "${srcdir}/SjaakII"

  [ -d build ] && rm -rf build
  mkdir build && cd build
  cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/SjaakII/build"

  make DESTDIR="${pkgdir}" install
}
