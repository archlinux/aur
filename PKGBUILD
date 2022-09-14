# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=batsignal
pkgver=1.6.1
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("849d323c5569f65b8e5145895611800ef224ed67c18bb3f0e28d78eb00eb6e0b")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install-service
}
