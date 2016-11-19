# Maintainer: Michael Straube <michael_straube@web.de>
# Contributor: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doomretro
pkgver=2.3.6
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
conflicts=('doom-retro-git')
source=("https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha1sums=('cb581aa9a0fada72996af785af3594b8718a0d1e')

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
