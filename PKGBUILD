# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>

pkgname=ignition-cmake
pkgver=2.1.1
pkgrel=1
pkgdesc="Provides modules that are used to find dependencies of ignition projects and generate cmake targets for consumers of ignition projects to link against."
arch=('any')
url="http://ignitionrobotics.org/libs/cmake"
license=('Apache')
groups=('development')
depends=('cmake' 'pkg-config' 'ruby-ronn' 'doxygen')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-cmake/get/${pkgname}2_${pkgver}.tar.bz2")
sha256sums=('ad89c81695b161694f86d5cffdc5d8fbbb896ea51290e30e4f07b3e7379464a2')

_dir="ignitionrobotics-ign-cmake-02065e48ea4f"

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
