pkgname=sdformat
pkgver=2.0.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'tinyxml')
makedepends=('cmake' 'doxygen')

_commit=a5ee0244239d
source=("https://bitbucket.org/osrf/${pkgname}/get/${pkgname}_${pkgver}.tar.bz2")
md5sums=(d3b98b2296f3f234019c551af6a27bf9)

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
