# Maintainer: Jo De Boeck <deboeck.jo@gmail.com>

pkgname=big-launcher
pkgver=ab7f562
pkgrel=1
makedepends=('cmake')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'spdlog' 'fmt' 'libwebp' 'harfbuzz' 'libinih' 'libxml2')
provides=('big-launcher')
conflicts=('big-launcher')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Launcher for the big screen"
license=('MIT')
source=('git+https://github.com/complexlogic/big-launcher')
url='https://github.com/complexlogic/big-launcher'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/big-launcher"
  git rev-parse --short HEAD
}

build() {
  mkdir -p "$srcdir/big-launcher/build"
  cd "$srcdir/big-launcher/build"
  cmake ..
  make

}

package() {
  install -Dm 755 "$srcdir/big-launcher/build/launcher" "$pkgdir/usr/bin/big-launcher"
}
