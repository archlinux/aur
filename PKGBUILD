# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=samsung-ml1660series
pkgver=1.00.39
pkgrel=1
epoch=1
pkgdesc="CUPS driver for Samsung ML-1660, ML-1661, ML-1665, ML-1666 and ML-1667 printers"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
conflicts=('samsung-printers')
source=("https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-C4010ND/uld_V${pkgver}_01.17.tar.gz")
md5sums=('1c5a88bc07785b17e8ecc899149327ee')

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
