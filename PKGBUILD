# Maintainer: endlesseden <eden@rose.place>

_pkgbase=fast_float
pkgname=$_pkgbase
pkgver=3.4.0
pkgrel=1
arch=(any)
url="https://github.com/fastfloat/fast_float/"
license=('MIT' 'Apache-2.0')
pkgdesc='Fast and exact implementation of the C++ from_chars functions:4x faster than strtod'
makedepends=(cmake git)
conflicts=($_pkgbase)
provides=($_pkgbase)
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/fastfloat/fast_float/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

#prepare() {
#
#}

build() {
  cd $_pkgbase-$pkgver

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" 

  make
}

package() {
  cd $_pkgbase-$pkgver/build
  make DESTDIR="$pkgdir" install
}
