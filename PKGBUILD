# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=2.4.3
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
optdepends=('timidity++: for music playback')
makedepends=('cmake')
conflicts=('doom-retro-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha256sums=('2cbc41f7167975a7b025d4b5a124299e0852b5682fd821910af78998253bd100')

build() {
  cd $pkgname-$pkgver

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
