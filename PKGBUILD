# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=litemdview
pkgver=0.0.31
pkgrel=1
pkgdesc="Suckless markdown viewer"
url="https://notabug.org/g0tsu/litemdview"
arch=('x86_64')
license=('GPL2')
depends=('gtkmm3')
makedepends=('fontconfig')
source=($url/archive/$pkgname-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('eb7b0a39ffe28849467924197af3a84c499d8cf1f7b3b48988fd5df0e1b2e4e5'
            '3e9e00dcf4165a1dc6dcea7a73881d3a6e2bf578f455cee3209e3cb0e81b3437')

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
