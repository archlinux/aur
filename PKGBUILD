# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=whatsapp-purple-git
pkgver=v0.8.3.r73.07ed931
pkgrel=1
pkgdesc="WhatsApp protocol implementation for libpurple (Pidgin)"
arch=("${CARCH}")
url="https://github.com/davidgfnet/${pkgname%-git}"
license=("GPL")
depends=("libpurple" "freeimage")
source=("${pkgname%-git}::git+https://github.com/davidgfnet/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make ARCH="${CARCH}"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
}
