#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=10.0.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-tools' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osrf/${pkgname}/archive/${pkgname}10_${pkgver}.tar.gz")
sha256sums=('3555ce443a736e9bd24577d894978e0236212bfd2b356022fd53b143b30152bf')

_dir="sdformat-${pkgname}10_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="$pkgdir/" install
}
