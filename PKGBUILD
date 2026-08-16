# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Prebuilt UCSC Genome Browser binary. Upstream files are unversioned, so
# pkgver is the HTTP Last-Modified date (YYYYMMDD) of the binary.

pkgname=ucsc-liftover-bin
pkgver=20250627
pkgrel=1
pkgdesc="UCSC liftOver: converts genome coordinates between assemblies"
arch=('x86_64')
url="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/"
license=('MIT')
depends=('glibc' 'curl' 'gcc-libs')
options=('!strip' '!debug')
source=("https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver"
        "LICENSE::https://raw.githubusercontent.com/ucscGenomeBrowser/kent/master/LICENSE")
sha256sums=('b7e295f3e06186ab34c89b2abdc58e98e55ac5aa158db4df1c6292b023a272bd'
            '793d774ec3941d88d5f93611639230030ea3e167282be144b6e5604bc5ad29a4')

package() {
    install -Dm755 "$srcdir/liftOver" "$pkgdir/usr/bin/liftOver"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
