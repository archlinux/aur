# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=libosso
pkgver=2.32
pkgrel=1
pkgdesc="Basic library for Maemo applications"
arch=("x86_64" "i686")
url="https://github.com/maemo-leste/libosso"
license=('LGPL2.1')
depends=('dbus-glib')
makedepends=('mce-dev')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maemo-leste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('bebce3550fc9bcf925c5c507d7982f68154d5d196576c2d9600e01fa2c8f1ecc84ed72c35e3f31e8262207b637d9ffe7ddf6568278c977dffbd11212d6da4e9a')

prepare() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
