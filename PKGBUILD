# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=whatsapp-purple
pkgver=0.9.0
pkgrel=4
pkgdesc="WhatsApp protocol implementation for libpurple (Pidgin)"
arch=("i686" "x86_64")
url="https://github.com/davidgfnet/${pkgname}"
license=("GPL")
depends=("libpurple" "freeimage")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidgfnet/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("f18d6dace57a504dbaacd56ba44792d5d5f009ef5380959bb7e1b833f0c81baf")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make ARCH="${CARCH}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
