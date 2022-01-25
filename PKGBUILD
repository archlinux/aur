# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=myterm
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple utility to start a user's preferred terminal emulator"
arch=("x86_64" "aarch64")
url="https://github.com/electrickite/${pkgname}"
license=("ISC")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("f19bbd0a94357343efb84a0d93f59340fe085c5cab2718b361f530e0c0dec90e")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" install
}
