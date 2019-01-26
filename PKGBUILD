# Maintainer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.2.0
pkgrel=1
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('i686' 'x86_64' 'armv7h' 'arm6h')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitlbee/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b815dcaceb9ee12a68cfe7401da503139ba92cb0396e8d52e5491fed04431d2c6e4cf667bcc6f457bc51b916c8dc1dc43dc277ff0a683a1c0d72a65e819fe5b4')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  libtool --finish ${pkgdir}/usr/lib/bitlbee/
}

# vim:set ts=2 sw=2 et:
