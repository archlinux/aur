# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=litemdview
pkgver=0.0.32
pkgrel=2
pkgdesc="Suckless markdown viewer"
url="https://codeberg.org/g0tsu/litemdview"
arch=('x86_64')
license=('GPL2')
depends=('gtkmm3')
makedepends=('fontconfig')
source=($url/archive/$pkgname-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('03e1dac27e6720a7e3864e5e89c4c1302713fce4d65e1c3f22c15dbdbed5effe'
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
