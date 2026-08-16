# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Prebuilt UCSC Genome Browser binaries. Upstream files are unversioned, so
# pkgver is the newest HTTP Last-Modified date (YYYYMMDD) across the group.

pkgname=ucsc-bigbed-bin
pkgver=20260407
pkgrel=1
pkgdesc="UCSC bigBed format utilities: bedToBigBed, bigBedToBed, bigBedInfo"
arch=('x86_64')
url="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/"
license=('MIT')
depends=('glibc')
options=('!strip' '!debug')
source=("https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigBedInfo"
        "LICENSE::https://raw.githubusercontent.com/ucscGenomeBrowser/kent/master/LICENSE")
sha256sums=('73e10feef3a685304d71c840058ae9a5113bdc4e134f161d3913cfebc5a2ec24'
            '9d1ea2158f5aa958fd8820fb7a2e5fb0947a9da7b183b8f9237429b8fbacd386'
            '0bd90a5a421d52da419ba5afb0d3e5a03244341ac416ada9358c7ccab159cf39'
            '793d774ec3941d88d5f93611639230030ea3e167282be144b6e5604bc5ad29a4')

package() {
    install -Dm755 "$srcdir/bedToBigBed" "$pkgdir/usr/bin/bedToBigBed"
    install -Dm755 "$srcdir/bigBedToBed" "$pkgdir/usr/bin/bigBedToBed"
    install -Dm755 "$srcdir/bigBedInfo"  "$pkgdir/usr/bin/bigBedInfo"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
