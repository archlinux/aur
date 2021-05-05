# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=opensurge
pkgver=0.5.2.1
pkgrel=1
pkgdesc='Open Surge is a fun 2D retro platformer inspired by Sonic games, and a game creation system.'
arch=('i686' 'x86_64' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/alemart/opensurge"
license=('GPL3')
depends=('allegro' 'surgescript')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/opensurge/archive/v$pkgver.tar.gz")
sha256sums=('27764a82d97b54026c90044fbc31ea4a61f7836568020b869e63376322a155af')

build() {
  cd $pkgname-$pkgver

  mkdir -p build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DGAME_BINDIR=/usr/bin ..
  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir/" install
}
