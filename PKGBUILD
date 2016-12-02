# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doomretro
pkgver=2.3.7
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
optdepends=('timidity++: for music playback')
makedepends=('cmake')
conflicts=('doom-retro-git')
source=("https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha1sums=('eafa144315a7adde42870c90d5b4261573d94b25')

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
