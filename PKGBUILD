# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=litemdview
pkgver=0.0.26
pkgrel=1
pkgdesc="Suckless markdown viewer"
url="https://notabug.org/g0tsu/litemdview"
arch=('x86_64')
license=('GPL2')
depends=('gtkmm3')
makedepends=('fontconfig')
provides=('litemdview')
conflicts=('litemdview')
source=($url/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('0aa98ed1e5769c925f10c916d69f5b11a2b7c8791813fff1d226cfedf78cb625')

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
