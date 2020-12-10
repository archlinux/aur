# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-sensors
pkgver=4.0.0
pkgrel=1
pkgdesc="Provides numerous sensor models designed to generate realistic data
from simulation environments."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/sensors"
license=('Apache')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-sensors/archive/${pkgname}4_${pkgver}.tar.gz")
sha256sums=('d7b3dd18e5130532d202acd08be0f941e552bd0f13154a0e9cd31d00919f2952')

_dir="ign-sensors-${pkgname}4_${pkgver}"

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
  #make DESTDIR="$pkgdir/" install
  make install
}
