# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=litemdview
pkgver=0.0.29
pkgrel=2
pkgdesc="Suckless markdown viewer"
url="https://notabug.org/g0tsu/litemdview"
arch=('x86_64')
license=('GPL2')
depends=('gtkmm3')
makedepends=('fontconfig')
source=($url/archive/$pkgname-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('b67e98655fc2f5c9cbb611d3463eabd36733ca9375f3af1f81b2805170ca3216'
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
