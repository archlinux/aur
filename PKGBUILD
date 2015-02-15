pkgname=sdformat
pkgver=2.3.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml')
makedepends=('cmake' 'doxygen')

_commit="517c99d40b47"
source=("https://bitbucket.org/osrf/${pkgname}/get/${pkgname}2_${pkgver}.tar.bz2")
md5sums=('b444c57806a6bf355b31049a4a6343f4')

build() {
  cd "${srcdir}/osrf-${pkgname}-${_commit}"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  cd "${srcdir}/osrf-${pkgname}-${_commit}/build"

  make DESTDIR="$pkgdir/" install
}
