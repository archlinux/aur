#Maintainer: Nxxx <nx dot tardis at gmail dot com>
pkgname=sdformat-9
pkgver=9.5.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-tools' 'ruby' 'ruby-rexml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osrf/sdformat/archive/sdformat9_${pkgver}.tar.gz")
sha256sums=('53791427b25c2485a2f74aab90e07ff8e7470f86532ecd30b9510bbec4122c97')

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
