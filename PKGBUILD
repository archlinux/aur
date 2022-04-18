# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-utils
pkgver=1.3.0
pkgrel=1
pkgdesc="Classes and functions for robot applications"
arch=('any')
url="https://ignitionrobotics.org/libs/utils"
license=('Apache')
depends=('cmake' 'ignition-cmake')
source=("https://github.com/ignitionrobotics/ign-utils/archive/${pkgname}1_${pkgver}.tar.gz")
sha256sums=('4ca4f553c2a1cf77c02bd37e0cba35837fd4f46145eac2b0334e33f74fd98163')

_dir="ign-utils-${pkgname}1_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make install
}
