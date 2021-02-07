# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=opensurge
pkgver=0.5.2
pkgrel=1
pkgdesc='Open Surge is a fun 2D retro platformer inspired by Sonic games, and a game creation system.'
arch=('i686' 'x86_64')
url="https://github.com/alemart/opensurge"
license=('GPL3')
depends=('allegro')
makedepends=('cmake' 'surgescript')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/opensurge/archive/v$pkgver.tar.gz")
sha256sums=('838b8ba506e45c800091d8ba7bb830d024907934fba35bf369d92fe13feaa3de')

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
