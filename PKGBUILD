# Maintainer: Daniel Anderson <dankles@freeslacker.com>

pkgname="ppd-xerox-colorqube8700-8900"
pkgver="5.360.0.0"
pkgrel="1"
pkgdesc="Printer driver for Xerox ColorQube 8700/8900"
arch=("any")
url="http://www.support.xerox.com/support/colorqube-8900/downloads/enus.html"
license=("custom")
makedepends=("unrar")
depends=("cups")
source=("http://download.support.xerox.com/pub/drivers/CQ8700/drivers/win7x64/en_GB/CQ8700-8900_PPD_en.exe"
	"LICENSE")
sha256sums=("3409d49fea39b770d232ed5200639a121ea32a566095176fc4ff4c98869c0b27"
	    "af5852333e592a9782140397763e15cd1959f7248e74f6d3aa4c0f48120c2a6e")

prepare() {
	unrar x CQ8700-8900_PPD_en.exe
}

package() {
	install -Dpm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dpm0644 "${srcdir}/XeroxColorQube8700S.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/XeroxColorQube8700S.ppd"
	install -Dpm0644 "${srcdir}/XeroxColorQube8700X.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/XeroxColorQube8700X.ppd"
	install -Dpm0644 "${srcdir}/XeroxColorQube8700XF.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/XeroxColorQube8700XF.ppd"
        install -Dpm0644 "${srcdir}/XeroxColorQube8900S.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/XeroxColorQube8900S.ppd"
        install -Dpm0644 "${srcdir}/XeroxColorQube8900X.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/XeroxColorQube8900X.ppd"
}

