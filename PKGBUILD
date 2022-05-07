# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=batsignal
pkgver=1.5.0
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("be3196bac5f369348123d78cacc3d20d29005a8bc93bcbc4541231843a5a7f5f")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install-service
}
