#Maintainer: Nxxx <nx dot tardis at gmail dot com>
pkgname=sdformat-9
pkgver=9.3.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-tools' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osrf/sdformat/archive/sdformat9_${pkgver}.tar.gz")
sha256sums=('6886cd905c74698000bf4e4bb378efe292411fab939d80d3263dfad430e50204')

_dir="sdformat-sdformat9_${pkgver}"

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
