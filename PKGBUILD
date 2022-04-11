# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libsedml
_pkgname=libSEDML
pkgver=2.0.30
pkgrel=1
pkgdesc="Simulation Experiment Description - Markup Language"
url=https://github.com/fbergmann/libSEDML
license=('BSD')
arch=('i686' 'x86_64')
depends=('libnuml')
source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('ba0111f7cc991ecc460f68e85182da75d62937522c9259c76e79a917e0fb9c24')

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
