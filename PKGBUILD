# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=bgc
pkgver=1.0.1
pkgrel=1
pkgdesc="Set your background to a color, using X11"
arch=('any')
url="https://github.com/mroutis/${pkgname}"
license=('Unlicense')
depends=('xorg-server')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4bda45295d95980f1d6210dca6d38e8578495841bad03c0b77d3fd44374edf27')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
