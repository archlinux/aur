# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=whatsapp-purple-git
pkgver=latest
pkgrel=1
pkgdesc="WhatsApp protocol implementation for libpurple (Pidgin)"
arch=("any")
url="https://github.com/davidgfnet/${pkgname%-git}"
license=("GPL")
depends=("libpurple" "freeimage")
source=("git+https://github.com/davidgfnet/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
}
