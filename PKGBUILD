# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=opensurge
pkgver=0.5.1.1
pkgrel=1
pkgdesc='Open Surge is a fun 2D retro platformer inspired by Sonic games, and a game creation system.'
arch=('i686' 'x86_64')
url="https://github.com/alemart/opensurge"
license=('GPL3')
depends=('allegro')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/opensurge/archive/v$pkgver.tar.gz")
sha256sums=('dfb598be9feb5a1abbd1217f386e934c43dad4efe423190a8950820ba109e209')

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
