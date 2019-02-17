# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=libplayback
pkgver=0.5
pkgrel=1
pkgdesc="Client API that allows an application to declare its playback state"
arch=("x86_64" "i686")
url="https://github.com/maemo-leste/libplayback"
license=('LGPL2.1')
depends=('dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maemo-leste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('88d3309bcf1e633fbb15cfd062fa7f52ab206b5c83a6c49e7f4de42ec6863299ed1b70bc205ab6de6273be4ca0fb4a2d1029719dd811add7b528fb901f265394')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
