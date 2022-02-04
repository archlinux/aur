# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-utils
pkgver=1.2.0
pkgrel=1
pkgdesc="Classes and functions for robot applications"
arch=('any')
url="https://ignitionrobotics.org/libs/utils"
license=('Apache')
depends=('cmake' 'ignition-cmake')
source=("https://github.com/ignitionrobotics/ign-utils/archive/${pkgname}1_${pkgver}.tar.gz")
sha256sums=('fba9d1d3cdafa73148697433bba206aa1251d24c0afa22f09bb3289092021449')

_dir="ign-utils-${pkgname}1_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make install
}
