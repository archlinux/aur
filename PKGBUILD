# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=doomretro
pkgver=2.8.1
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('0a1791dfa82157681230d62356bfbebd953386f44e370719338c857c0f89f1cb025074a0ba3f86afa7b2025712189dac4003374e5cb5746dcc5edb674cc80f1a')

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
