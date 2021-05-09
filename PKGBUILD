# Maintainer: dreieck
# Contributor: Joker-jar <joker-jar@yandex.ru>

pkgname=deadbeef-plugins-psipublish
pkgver=1.3
pkgrel=3
pkgdesc="Plugin for DeaDBeeF to publish tune in Psi/Psi+"
arch=('i686' 'x86_64')
url="http://psi-im.org/wiki/Publish_Tune"
license=('GPL2')
depends=('deadbeef')
makedepends=()
source=('psipublish.c::http://ix.io/3mhl')
sha256sums=('eae145f53719a19e64e2cb15e3c0a298329a8ce3f4be0de292f7e6f2d792420e')

build() {
  cd "${srcdir}"
  # gcc ${CFLAGS} -fPIC -I/usr/include/deadbeef -std=c99 -shared -o psipublish.so psipublish.c
  gcc ${CFLAGS} -I/usr/include/deadbeef -shared -o psipublish.so psipublish.c
}

package() {
  cd "${srcdir}"
  install -D -v -m644 'psipublish.so' "${pkgdir}/usr/lib/deadbeef/psipublish.so"
}
