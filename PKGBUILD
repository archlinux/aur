# Maintainer: Ales Katona <almindor@gmail.com>

pkgname="mmapper"
pkgver="23.01.0"
pkgrel="1"
pkgdesc="MMapper2 is a MUD (Multi-User Dungeon) mapper especially written for the MUD MUME"
arch=('x86_64')
url='https://github.com/MUME/MMapper'
license=('GPL2')
depends=('qt5-base')
makedepends=('cmake')
optdepends=()
provides=('mmapper')
replaces=()
conflicts=()
options=(strip)
source=('https://github.com/MUME/MMapper/archive/refs/tags/v23.01.0.tar.gz')
sha256sums=('1c95e31541956ce48c382636b2a210feb607c6fd382f0138b5d43b4406d306e4')

prepare() {
  cd "MMapper-${pkgver}"
  mkdir -p build
}

build() {
  cd "MMapper-${pkgver}/build"
  cmake -S .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd "MMapper-${pkgver}/build"
  make test
}

package() {
  cd "MMapper-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
