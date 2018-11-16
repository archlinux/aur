# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=doomretro
pkgver=2.7.4
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('0de22129533d3c7d032c1d18d07e6faaf3268c9a446bb4343c39b392b90f5feb51cc36490a732d59d6f8b9157b4ba0962db13bb61b5804ed89518c72b638c648')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
