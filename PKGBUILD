# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.3.0
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
url='https://sourceforge.net/projects/dmidiplayer/'
license=('GPL3')
arch=('x86_64')
depends=('drumstick' 'qt5-base' 'uchardet')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('846b695ffba65a2d1e6053d7d399d983321879ef793848b86ad3b4f6d6875f88')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
