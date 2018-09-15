# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=doomretro
pkgver=2.7.3
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('f178bc9171c7fce3e4ebb852bbb18d46d806dcda9d1d2e76fdb3289d3c7c5dad6fc689126371dc5711e911edfcb652c265ad7c50f5b29b62643bbffcf9f52d34')

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
