# Maintainer: Teon Banek <intothedungeon at gmail dot com>
pkgname="into-the-dungeon++"
pkgver="0.9.2"
pkgrel=1
pkgdesc="Simple graphical roguelike."
arch=('i686' 'x86_64')
url="http://studio7.guru-gaming.org"
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl_image' 'sdl_mixer')
makedepends=('cmake>=3')
install=into-the-dungeon.install
changelog=ChangeLog
source=("$pkgname-$pkgver.tar.gz::https://github.com/Th30n/into-the-dungeon/archive/v$pkgver.tar.gz")

build() {
  cd "into-the-dungeon-$pkgver"
  cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd "into-the-dungeon-$pkgver"
  make test
}

package() {
  cd "into-the-dungeon-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('a92de69b0dbd1a06a954d7f5e0314c46')
