# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-utils
pkgver=1.4.0
pkgrel=1
pkgdesc="Classes and functions for robot applications"
arch=('any')
url="https://gazebosim.org/libs/utils"
license=('Apache')
depends=('cmake' 'ignition-cmake')
source=("https://github.com/gazebosim/gz-utils/archive/${pkgname}1_${pkgver}.tar.gz")
sha256sums=('74ba40f8a35f9ae07102402d4acde11e4f9a1d52663a339388fe086527093f86')

_dir="gz-utils-${pkgname}1_${pkgver}"

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
