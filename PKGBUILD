# Maintainer: Michael Gisbers <arch@mylinuxtime.de>

pkgname=starcupdrv
pkgver=3.10.0
pkgrel=1
pkgdesc="CUPS Printer Driver for Star Printer"
url="http://www.starmicronics.com"
license=('LGPL')
depends=('libcups')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::http://starmicronics.com/Support/DriverFolder/drvr/starcupsdrv-${pkgver}_linux.tar.gz")

prepare() {
    cd "${srcdir}/starcupsdrv-${pkgver}_linux/SourceCode"
    tar xvzf starcupsdrv-src-${pkgver}.tar.gz
}

build() {
    cd "${srcdir}/starcupsdrv-${pkgver}_linux/SourceCode/starcupsdrv"
    make
}

package() {
    cd "${srcdir}/starcupsdrv-${pkgver}_linux/SourceCode/starcupsdrv/install"
    install -d "${pkgdir}/usr/share/cups/model/" "${pkgdir}/usr/lib/cups/filter"
    install *.ppd "${pkgdir}/usr/share/cups/model/"
    install rastertostar* "${pkgdir}/usr/lib/cups/filter"
}
md5sums=('e2d2390fa4d3bfef45882b70e7836261')
sha256sums=('3ddde3de7de07bebaf13980521d78d3996a745de4ae39c3f348371cccda29e98')
sha512sums=('62ab3f2452288982af31951394ce9b9283d6bc59959106b745669175db8524909f6f17acb41b35031f544d9f954ad351c3a7474892f89370f0b362396b7bc049')
