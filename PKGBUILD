# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libsedml
_pkgname=libSEDML
pkgver=0.4.4
pkgrel=1
pkgdesc="Simulation Experiment Description - Markup Language"
url="http://libsedml.sourceforge.net/libSedML"
license=('BSD')
arch=('i686' 'x86_64')
depends=('libnuml')
source=($_pkgname-$pkgver.tar.gz::https://github.com/fbergmann/libSEDML/archive/v$pkgver.tar.gz)
sha256sums=('74bf15442216bcee5ee15cb8abcbdf69fc04dfdd4ffe789abec8ea7a7dfff65a')

build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    ..
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver/build
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
}
