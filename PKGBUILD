# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doomretro
pkgver=2.3.9
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
sha256sums=('4e5bf25d79d4c91e0ffad58f04c6c02eb25037895476ba24a081738f8a208f96')

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
