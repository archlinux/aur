# Maintainer: K5TRP <K5TRP@onlyhams.ca>
# Contributor: bork <bork at stepanian dot ca>

pkgname=xnecview
_pkgname="xnecview"
pkgver=1.37
pkgrel=1
pkgdesc="A program for visualizing NEC2 input and output data"
arch=('i686' 'x86_64')
url="https://www.pa3fwm.nl/software/xnecview/"
license=('GPL2')
depends=('gtk2' 'libpng')
provides=('xnecview')
conflicts=('xnecview')
source=(https://www.pa3fwm.nl/software/xnecview/xnecview-$pkgver.tgz)
md5sums=('7ca60ed8ba9ce2740a78265a097b824b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/xnecview.1x" "${pkgdir}/usr/share/man/man1/xnecview.1x"
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/xnecview" "$pkgdir/usr/bin/xnecview"
}
