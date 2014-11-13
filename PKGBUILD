pkgname=sdformat
pkgver=2.2.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'tinyxml')
makedepends=('cmake' 'doxygen')

_commit=95b7b298de85
source=("https://bitbucket.org/osrf/${pkgname}/get/${pkgname}2_${pkgver}.tar.bz2")
md5sums=(a7f1c2cfb7ddc5c5bfe227a71698a392)

build() {
  cd "${srcdir}/osrf-${pkgname}-${_commit}"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "${srcdir}/osrf-${pkgname}-${_commit}/build"

  make DESTDIR="$pkgdir/" install
}
