pkgname=sdl2pp
pkgver=0.12.0
pkgrel=1
pkgdesc='SDL2 wrapper for C++11'
arch=('x86_64' 'i686')
url="https://github.com/libSDL2pp/libSDL2pp"
license=('zlib')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake' 'git' 'ninja')
source=("git://github.com/libSDL2pp/libSDL2pp#tag=$pkgver")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS=-w \
    -GNinja \
    "$srcdir/libSDL2pp"
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
