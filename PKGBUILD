# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=batsignal
pkgver=1.5.1
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("99f09816529932b73f95d1989dc29fa952468193f7438e232d4e0627be01969b")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install-service
}
