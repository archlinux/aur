# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=3.6
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('70fa42b4abbdb2d0954a5085f0bafdf25b5a745aee76d38e8963f4d2cf44ee2178b13d03205c87b335ff5b6c9ee447c9f0eddaeaf5e5796fe6c0a80193aa67b3')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../"$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
