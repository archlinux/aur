# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Prebuilt UCSC Genome Browser binaries. Upstream files are unversioned, so
# pkgver is the newest HTTP Last-Modified date (YYYYMMDD) across the group.

pkgname=ucsc-psl-bin
pkgver=20250627
pkgrel=1
pkgdesc="UCSC PSL alignment utilities: pslToBed, pslReps, pslCDnaFilter"
arch=('x86_64')
url="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/"
license=('MIT')
depends=('glibc' 'curl' 'gcc-libs')
options=('!strip' '!debug')
source=("https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/pslToBed"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/pslReps"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/pslCDnaFilter"
        "LICENSE::https://raw.githubusercontent.com/ucscGenomeBrowser/kent/master/LICENSE")
sha256sums=('e962977fea079c874fbc8820ccad12a8e6900b31914c1dd9a6de1fed5992f090'
            'eeb0400455cfe4debdefe1f74e268e154dbf7f1e08fba4fe84eed97d39f7968a'
            '92ab6a909769bca6ddd4facf3caffa165e0247229d223293124af6edbb8c7b4e'
            '793d774ec3941d88d5f93611639230030ea3e167282be144b6e5604bc5ad29a4')

package() {
    install -Dm755 "$srcdir/pslToBed"     "$pkgdir/usr/bin/pslToBed"
    install -Dm755 "$srcdir/pslReps"      "$pkgdir/usr/bin/pslReps"
    install -Dm755 "$srcdir/pslCDnaFilter" "$pkgdir/usr/bin/pslCDnaFilter"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
