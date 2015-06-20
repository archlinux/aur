# Maintainer: josephgbr <rafael.f.f1@gmail.com>
pkgname=oki-330-530-ps
pkgver=4.0
pkgrel=1
pkgdesc="CUPS drivers for OKI C330 and C530 PS printers"
arch=(any)
url="http://www.okidata.com"
license=('GPL')
depends=('cups' 'ghostscript')
source=("ftp://ftp2.okidata.com/pub/drivers/linux/SFP/color/desktop/C330PS.tar")
md5sums=('3919ba609354aa7a0351e6fb84625e0b')

package() {
	cd "$srcdir/C330PS"
	install -Dm755 okijobaccounting "$pkgdir/usr/lib/cups/filter/okijobaccounting"
	install -Dm444 C330PS.ppd.gz "$pkgdir/usr/share/cups/model/C330PS.ppd.gz"
	gunzip "$pkgdir/usr/share/cups/model/C330PS.ppd.gz"
}
