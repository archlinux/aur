# Maintainer: Tarcisio Fedrizzi <tarcisio.fedrizzi@gmail.com>

pkgname="ppd-xerox-colorqube9300"
pkgver="5.371.0.0"
pkgrel="1"
pkgdesc="Printer driver for Xerox ColorQube 9301/9302/9303"
arch=("any")
url="http://www.support.xerox.com/support/colorqube-9300-series/support/enus.html"
license=("custom")
makedepends=("unrar")
depends=("cups")
source=("http://download.support.xerox.com/pub/drivers/CQ930X/drivers/win7/en_GB/CQ930X_PPD_en-US.exe"
	"LICENSE")
sha256sums=("76251f5756b07f5cf789a479c99192051e9bc546f4da09a17947bd27ef5aef57"
	    "af5852333e592a9782140397763e15cd1959f7248e74f6d3aa4c0f48120c2a6e")

prepare() {
	unrar x CQ930X_PPD_en-US.exe
}

package() {
	install -Dpm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dpm0644 "${srcdir}/XeroxColorQube9301.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/Xerox-ColorQube9301.ppd"
	install -Dpm0644 "${srcdir}/XeroxColorQube9302.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/Xerox-ColorQube9302.ppd"
	install -Dpm0644 "${srcdir}/XeroxColorQube9303.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/Xerox-ColorQube9303.ppd"
}
