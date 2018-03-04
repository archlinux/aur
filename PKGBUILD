# Maintainer: Dennis Fink <dennis.fink@c3l.lu>
# Maintainer: Ulrich Huber <ulrich@huberulrich.de>

pkgname=dell-c2665dnf
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Dell C2665dnf"
arch=("i686" "x86_64")
url="http://www.dell.com/support/home/us/en/19/product-support/product/dell-c2665dnf/drivers"
license=('custom')
depends=('lib32-libcups')
source=('https://downloads.dell.com/FOLDER01815904M/1/C2665dnf-Linux-Driver.zip' 'http://i.dell.com/sites/doccontent/legal/terms-conditions/en/Documents/Dell-EMC-SW-EULA.pdf')
sha256sums=('4d258bd49f461c20207766f5d5542893b5c3801e676635edaf6d96c8e2006e69' '7877b1aca91950b91450a22d89abeb1be022ba349be3c8375e338ee38cec3a67')

prepare() {
	cd "C2665dnf-Linux-Driver"
    bsdtar -xf Dell-C2665-Color-MFP-1.0-1.i686.rpm
}

package() {
    install -D -m755 "C2665dnf-Linux-Driver/usr/lib/cups/filter/Dell-C2665-Color-MFP/DLPSACJFilter" "$pkgdir/usr/lib/cups/filter/Dell-C2665-Color-MFP/DLPSACJFilter"
    install -D -m644 "C2665dnf-Linux-Driver/usr/share/cups/model/Dell/Dell_C2665dnf_Color_MFP.ppd.gz" "$pkgdir/usr/share/cups/model/Dell/Dell_C2665dnf_Color_MFP.ppd.gz"
    install -D -m644 "Dell-EMC-SW-EULA.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}
