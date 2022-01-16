# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=litemdview
pkgver=0.0.30
pkgrel=1
pkgdesc="Suckless markdown viewer"
url="https://notabug.org/g0tsu/litemdview"
arch=('x86_64')
license=('GPL2')
depends=('gtkmm3')
makedepends=('fontconfig')
source=($url/archive/$pkgname-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('bfe38232f04be97239cd9d42781c48dfde536064287238e5e9455a856e28c8c7'
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
