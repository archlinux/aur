# Maintainer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.1.1
pkgrel=0
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('i686' 'x86_64' 'armv7h' 'arm6h')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitlbee/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('071c47675f996975ac0a4b269dcd5e1b32b1a455d44e446556cb34bb0231bc5bde25cb4b7d24378645015ead3dddafae9e81807923ac6786d24012b8d5fec08b')

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
