# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=doomretro
pkgver=2.7.5
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('5a46921adf0afd60476aac9241f386621c0fc839aec7e78c5cb75f6dcab47df0256450eb93e3cd0d4058621184dbacf3fac56d90637f371fd20e1833abcaad96')

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
