# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=opensurge
pkgver=0.5.1.2
pkgrel=1
pkgdesc='Open Surge is a fun 2D retro platformer inspired by Sonic games, and a game creation system.'
arch=('i686' 'x86_64')
url="https://github.com/alemart/opensurge"
license=('GPL3')
depends=('allegro')
makedepends=('cmake' 'surgescript')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/opensurge/archive/v$pkgver.tar.gz")
sha256sums=('d060e3215231741ce0b4e5b897af52f8755c57660c8a33856bf921c83af18ba2')

build() {
  cd $pkgname-$pkgver

  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr/bin ..
  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir/" install
}
