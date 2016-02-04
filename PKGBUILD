# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=samsung-ml1660series
pkgver=3.00.65
pkgrel=5
pkgdesc="CUPS driver for Samsung ML-1660, ML-1661, ML-1665, ML-1666 and ML-1667 printers"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
conflicts=('samsung-printers')
source=("http://org.downloadcenter.samsung.com/content/DR/201311/20131111155959500/uld_v1.00.06.tar.gz")
md5sums=('94ee35696ddad334a53f76c9606607a5')
sha256sums=('cc0144ede06710cc4c8c0e1bc6aa00464a4029d8153cff63f63fa1c6eb2b61e7')

package() {
	cd $srcdir

	install -m 644 -D \
		${srcdir}/uld/noarch/share/ppd/Samsung_ML-1660_Series.ppd \
		${pkgdir}/usr/share/cups/model/Samsung_ML-1660_Series.ppd
	if [ "$CARCH" = "x86_64" ]; then
		install -m 755 -D \
			${srcdir}/uld/x86_64/rastertospl \
			${pkgdir}/usr/lib/cups/filter/rastertospl
	else
		install -m 755 -D \
			${srcdir}/uld/i386/rastertospl \
			${pkgdir}/usr/lib/cups/filter/rastertospl
	fi
}
