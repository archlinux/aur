pkgname=sdformat
pkgver=2.0.1
pkgrel=2
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'tinyxml')
makedepends=('cmake' 'doxygen')

_commit=d79259b26096
source=("https://bitbucket.org/osrf/${pkgname}/get/${pkgname}2_${pkgver}.tar.bz2")
md5sums=(a29ee0a99f0e9b9a55ffd3b976b26b0a)

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
