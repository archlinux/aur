# Maintainer: Colin Arnott <arnottcr@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook
pkgver=1.0.0
pkgrel=2
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('any')
url='https://github.com/jgeboski/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
source=('https://github.com/jgeboski/bitlbee-facebook/archive/v1.0.0.tar.gz')
sha512sums=('14cf6263c12636465a73f6fa442083af2c2f7bddc101fca84a8a6cec4b8c58cd0d5e0aea3901c25bd27ea7f2eb5b5fb65543a1501db948066cc780f52339a94e')

pkgver() {
  cd ${pkgname%%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%%-git}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%%-git}
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
