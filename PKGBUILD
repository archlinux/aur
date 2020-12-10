# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=3.1.0
pkgrel=1
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/physics"
license=('Apache')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-physics/archive/${pkgname}3_${pkgver}.tar.gz")
sha256sums=('b8e5460d2808e20237b2ee0a6a6b7613b56412f5f6e2a5e153e48e8faae8ab77')

_dir="ign-physics-${pkgname}3_${pkgver}"

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
