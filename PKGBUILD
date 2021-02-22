# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.0.3
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('a61f1c878ea84789b65f1f24d307dfc30eae433ae2dd31b361c8e62b81899866afec6c915d4b9dd8d28d83ab4ca928de5018328aec7e65055e9141e8a0e00a9d')

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
