# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook-git
pkgver=r49.c87650c
pkgrel=1
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('any')
url='https://github.com/jgeboski/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
makedepends=('git')
source=('git+https://github.com/jgeboski/bitlbee-facebook.git')
md5sums=('SKIP')

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
