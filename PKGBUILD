# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname="brother-hl-1112"
pkgver="3.0.1_1"
pkgrel="2"
pkgdesc="Brother HL-1112 CUPS Driver"
url="http://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=hl1112_us_eu"
license=('GPL2')
arch=('x86_64')
depends=('cups')

sha256sums=(
	be1dce6a4608cb253b0b382db30bf5885da46b010e8eb595b15c435e2487761c
)

source=(
	http://download.brother.com/welcome/dlf100422/hl1110cupswrapper-GPL_src-3.0.1-1.tar.gz
)

prepare() {
	cd "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/brcupsconfig"
	sh ./mk
}

package() {
	install -m 644 -D "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/PPD/brother-HL1110-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-HL1110-cups-en.ppd"
	install -m 755 -D "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/filter/brother_lpdwrapper_HL1110" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HL1110"
	install -m 755 -D "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/brcupsconfig/brcupsconfig4" "$pkgdir/usr/bin/brcupsconfig4"
}
