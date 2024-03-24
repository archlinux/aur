# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Maintainer: Dennis Fink <dennis.fink@c3l.lu>
# Maintainer: Ulrich Huber <ulrich@huberulrich.de>

pkgname=dell-c2665dnf
pkgver=1.0.1
pkgrel=2
pkgdesc="CUPS driver for Dell C2665dnf"
arch=("i686" "x86_64")
url="http://www.dell.com/support/home/us/en/19/product-support/product/dell-c2665dnf/drivers"
license=("custom")
depends=("lib32-libcups")
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://dl.dell.com/FOLDER01815904M/1/C2665dnf-Linux-Driver.zip" "LICENSE")
sha256sums=('4d258bd49f461c20207766f5d5542893b5c3801e676635edaf6d96c8e2006e69'
            '258c48bd485f6b4e1c5e05dfbce0d7d8a794ca408124124b43d43b6de6655eec')

prepare() {
    cd "C2665dnf-Linux-Driver"
    bsdtar -xf Dell-C2665-Color-MFP-1.0-1.i686.rpm
}

package() {
    install -D -m755 "C2665dnf-Linux-Driver/usr/lib/cups/filter/Dell-C2665-Color-MFP/DLPSACJFilter" "$pkgdir/usr/lib/cups/filter/Dell-C2665-Color-MFP/DLPSACJFilter"
    install -D -m644 "C2665dnf-Linux-Driver/usr/share/cups/model/Dell/Dell_C2665dnf_Color_MFP.ppd.gz" "$pkgdir/usr/share/cups/model/Dell/Dell_C2665dnf_Color_MFP.ppd.gz"
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
