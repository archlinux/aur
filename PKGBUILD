# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=gjid
pkgver=3.3
pkgrel=1
pkgdesc="Sokoban-style puzzle game"
arch=('x86_64')
url="https://github.com/msharov/gjid"
license=('MIT')
depends=('libxcb')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab2d09b0dd821f23da2864936d0beca44d1dcee2e865fcba72ba0ca93f03f967')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix="/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
