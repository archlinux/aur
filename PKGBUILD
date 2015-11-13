# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=dell-c2665dnf
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Dell C2665dnf"
arch=("i686" "x86_64")
url="http://www.dell.com/support/home/us/en/19/product-support/product/dell-c2665dnf/drivers"
license=('unknown')
depends=('lib32-libcups')
makedepends=('rpmextract')
source=("http://downloads.dell.com/FOLDER01815904M/1/C2665dnf-Linux-Driver.zip")
md5sums=('40a5499a05fc337430e5a213e23e35da')

prepare() {
	cd "C2665dnf-Linux-Driver"
        rpmextract.sh Dell-C2665-Color-MFP-1.0-1.i686.rpm
}

package() {
	cd "C2665dnf-Linux-Driver"
        install -D -m755 "usr/lib/cups/filter/Dell-C2665-Color-MFP/DLPSACJFilter" "$pkgdir/usr/lib/cups/filter/Dell-C2665-Color-MFP/DLPSACJFilter"
        install -D -m644 "usr/share/cups/model/Dell/Dell_C2665dnf_Color_MFP.ppd.gz" "$pkgdir/usr/share/cups/model/Dell/Dell_C2665dnf_Color_MFP.ppd.gz"
}
