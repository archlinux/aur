# Maintainer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.2.1
pkgrel=1
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('i686' 'x86_64' 'armv7h' 'arm6h')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitlbee/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6424931a93695c41816304177f13d3c02c1e7e352f8548a18a1245cc90b151123d31d354147851d56f6b42946c30c43eaefb6d2f296a8078067eb5c65c0da1d5')

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
