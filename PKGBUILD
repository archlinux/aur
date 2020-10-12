# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=zig-game-git
pkgver=1
pkgrel=1
pkgdesc="It's a game where you shoot stuff"
arch=('x86_64')
url="https://github.com/bcampbell/zig"
license=('GPL3')
depends=('zlib' 'libpng' 'sdl2' 'sdl2_mixer' 'opengl-driver')
makedepends=('git' 'meson')
provides=('zig-game')
conflicts=('zig-game')
source=("git+https://github.com/bcampbell/zig")
sha256sums=('SKIP')

build() {
  cd zig
  arch-meson build
  ninja -C build
}

package() {
  cd zig
  DESTDIR="$pkgdir"/ ninja -C build install
}
