# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Prebuilt UCSC Genome Browser binaries. Upstream files are unversioned, so
# pkgver is the newest HTTP Last-Modified date (YYYYMMDD) across the group.

pkgname=ucsc-twobit-bin
pkgver=20260407
pkgrel=1
pkgdesc="UCSC twoBit genome format utilities: faToTwoBit, twoBitToFa, twoBitInfo"
arch=('x86_64')
url="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/"
license=('MIT')
depends=('glibc')
options=('!strip' '!debug')
source=("https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/twoBitToFa"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/twoBitInfo"
        "LICENSE::https://raw.githubusercontent.com/ucscGenomeBrowser/kent/master/LICENSE")
sha256sums=('78b3db746e0ca2fcf3c10fc0c0c231eaeac848b5fe40285a66ff664ae4596e08'
            'a591aa8920b316a810b991fc1e23736b20e73f98b3c3ad16dba3418c27524b26'
            'fca5427e1aedd00be0d32117420010c9162d442562c83305b2d3e3c8e6cebe71'
            '793d774ec3941d88d5f93611639230030ea3e167282be144b6e5604bc5ad29a4')

package() {
    install -Dm755 "$srcdir/faToTwoBit" "$pkgdir/usr/bin/faToTwoBit"
    install -Dm755 "$srcdir/twoBitToFa" "$pkgdir/usr/bin/twoBitToFa"
    install -Dm755 "$srcdir/twoBitInfo" "$pkgdir/usr/bin/twoBitInfo"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
