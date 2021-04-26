pkgname=sdl_kitchensink
_pkgname=SDL_kitchensink
pkgver=1.0.9
pkgrel=1
pkgdesc="FFmpeg and SDL2 based library for audio and video playback, written in C99."
arch=('any')
url=""
license=('GPL')
depends=('unzip')
makedepends=('cmake' 'sdl2' 'ffmpeg' 'gcc')
source=('https://github.com/katajakasa/SDL_kitchensink/archive/refs/tags/1.0.9.tar.gz')
sha256sums=('SKIP')

build() {
  cd "$srcdir/SDL_kitchensink-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/local ..
  make
}
package() {
  cd "$srcdir/SDL_kitchensink-$pkgver/build"
  make install
}
