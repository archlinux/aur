# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=bgc
pkgver=1.0.0
pkgrel=1
pkgdesc="Set your background to a color, using X11"
arch=('any')
url="https://github.com/mroutis/bgc"
license=('Unlicense')
depends=('xorg-server')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1bd9fa8e221f635d76bd8c3382117af8b8c4e1eb74b0921844ce7273cf193612')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  DESTDIR="${pkgdir}/usr/bin" make install
}
