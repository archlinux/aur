# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=oki-400-ps
pkgver=1.4
pkgrel=2
pkgdesc="CUPS drivers for OKI B4000, B400 and MB400 PS printers"
arch=('any')
url="http://www.okidata.com/mkt/html/nf/Drivers.html"
license=('GPL')
depends=('cups' 'ghostscript' 'coreutils')
source=("ftp://ftp2.okidata.com/pub/drivers/linux/SFP/monochrome/desktop/OK400PS.tar")
install=oki.install
md5sums=('1a89c1c247745cfaef03cfe1abb45a85')

build() {
    cd "$srcdir/OK400PS"
    gunzip OK400PS.ppd.gz
}

package() {
    cd "$srcdir/OK400PS"

    install -D -m 755 okijobaccounting "${pkgdir}/usr/lib/cups/filter/okijobaccounting"
    install -D -m 644 OK400PS.ppd "${pkgdir}/usr/share/cups/model/ok400ps.ppd"
}
