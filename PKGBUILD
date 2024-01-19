# Maintainer: K5TRP <K5TRP@onlyhams.ca>
# Contributor: bork <bork at stepanian dot ca>

pkgname=xnecview
_pkgname="xnecview"
pkgver=1.37
pkgrel=2
pkgdesc="A program for visualizing NEC2 input and output data"
arch=('i686' 'x86_64')
url="https://www.pa3fwm.nl/software/xnecview/"
license=('GPL-2.0-only')
depends=('gtk2' 'libpng')
provides=('xnecview')
conflicts=('xnecview')
source=(https://www.pa3fwm.nl/software/xnecview/xnecview-$pkgver.tgz)
sha256sums=('4e2cefa5887260845a09d44edab5ff9799d5d091857cf8af0a9a590cf35951f0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/xnecview.1x" "${pkgdir}/usr/share/man/man1/xnecview.1x"
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/xnecview" "$pkgdir/usr/bin/xnecview"
}
