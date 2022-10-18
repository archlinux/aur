# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=myterm
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple utility to start a user's preferred terminal emulator"
arch=("x86_64" "aarch64")
url="https://github.com/electrickite/${pkgname}"
license=("ISC")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("69dfd8b5201abe21bbee7a363f95d02b022785fb4dd81f6d254058f31da4578f")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" install
}
