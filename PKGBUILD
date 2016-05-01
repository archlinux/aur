# Maintainer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.0.0
pkgrel=4
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('i686' 'x86_64' 'armv7h' 'arm6h')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=("https://github.com/bitlbee/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a8e3520c799c8b7b526afe322f6713f9a9d83d8763c06349737b4c759a7c0b4ce64feb362eeba12a80eec0f9db669291b521257d52f316bcaa2b51d80db2789b')

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
