# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname="Audiality2"
pkgname="audiality2"
pkgver=1.9.0
pkgrel=1
pkgdesc='Realtime audio and music engine'
arch=(x86_64)
url='http://audiality.org/'
license=(zlib)

makedepends=(
  'base-devel'
  'cmake'
)
depends=(
  'sdl'
  'jack'
)

source=(
  "http://audiality.org/download/$_pkgname-$pkgver.tar.bz2"
)
sha256sums=(
  '9fbc79f361085767b76dac6bb1bd886a03d5126297e078a6491df4530643fc8e'
)

build() {
  rm -rf build; mkdir build; cd build
  cmake ../"$_pkgname-$pkgver"
  make
}

package() {
  cd build
  DESTDIR="$pkgdir" make install
}
