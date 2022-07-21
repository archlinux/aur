# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=gjid
pkgver=3.3
pkgrel=2
pkgdesc="Sokoban-style puzzle game"
arch=('x86_64')
url="https://sourceforge.net/projects/gjid"
license=('MIT')
depends=('libxcb')
source=("$pkgname-$pkgver.tar.gz::$url/files/$pkgname-$pkgver.tar.gz/download")
sha256sums=('ae992c1ea0da8e57e9e6a56d94e7f629769e38b1010d964e2818ca1161951074')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix="/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
