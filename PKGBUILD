# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=batsignal
pkgver=1.6.0
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("799690eef5727037693af7e5d9283152e35ce31dae75738e54fcc0185d520569")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install-service
}
