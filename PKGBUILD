# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=doomretro
pkgver=2.7.2
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('5c82f25e90be95ea51e26059967c6fdb75c9e57713906f32173adb98215eb8bd4f97566fbc80245d240031d4e174a2f3eee33304b0432ad6bc059b3c8735315e')

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
