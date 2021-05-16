# Maintainer: Kim Larsson <kim@cunimb.org>
# Contributer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.2.2
pkgrel=1
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('i686' 'x86_64' 'armv7h' 'arm6h')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitlbee/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('534e7e704e7ddd296c810819171b9c4770747dde109a9bbdfb41fc05602b1d9ad9bfd2ec6c7a62ffb0c85ec61252b1597217cdee7ccffd191da897a7d40085cc')

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
