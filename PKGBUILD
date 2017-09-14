# Maintainer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.1.2
pkgrel=1
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('i686' 'x86_64' 'armv7h' 'arm6h')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitlbee/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3e27935cd4c8c1d55de9dfe9d6fd1e7aef1bf410e64c711436875ddfb83f67f1da0055af3b279d2d6627bafe438a7689e280c2bfd51ec4f64cf7c614182003da')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
