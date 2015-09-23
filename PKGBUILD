# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=samsung-ml1860series
pkgver=1.00.21
pkgrel=1
pkgdesc="CUPS printer driver for Samsung ML-1860 Series"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups>=1.6.0' 'ghostscript')
source=("http://org.downloadcenter.samsung.com/content/DR/201403/20140312133051625/ULD_V1.00.21.tar.gz")
md5sums=('9ab77b1bb5ed3ad10aea1a1a08bfa753')

package() {
	cd $srcdir

	install -m 644 -D \
		${srcdir}/uld/noarch/share/ppd/Samsung_ML-1860_Series.ppd \
		${pkgdir}/usr/share/cups/model/Samsung_ML-1860_Series.ppd
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
