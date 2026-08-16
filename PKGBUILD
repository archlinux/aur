# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Prebuilt UCSC BLAT suite. Upstream files are unversioned, so pkgver is
# the newest HTTP Last-Modified date (YYYYMMDD) across the group. The BLAT
# suite is free for personal, academic and non-profit use only; commercial
# use requires a license from Kent Informatics (kentinformatics.com).

pkgname=ucsc-blat-bin
pkgver=20260407
pkgrel=1
pkgdesc="UCSC BLAT alignment suite: blat, gfServer, gfClient, isPcr"
arch=('x86_64')
url="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/"
license=('custom')
depends=('glibc')
options=('!strip' '!debug')
source=("https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/blat/blat"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/blat/gfServer"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/blat/gfClient"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/blat/isPcr"
        "LICENSE::https://raw.githubusercontent.com/ucscGenomeBrowser/kent/master/src/blat/LICENSE")
sha256sums=('c0e949dc6d2f728f483e00201a044245b9f4129bb4f8ffcea4ecc8bff5b13b07'
            '35f1c49ae32b001f7159b3c8ab87ad1f017069e07b3b656c755f68c1d4c7d168'
            '07b0cfb42d3e9e43085c4107fa9978c017d87225ad587b8f87dd8d8090a68193'
            '0f31c25ab25bff1071515c9c278459b09ccf8bf0c078324d896801e70f64e052'
            '2e30d3c37340e3e3b5c20fe226c299a6f3ebf427103bf5d3ad225e2f85e45989')

package() {
    install -Dm755 "$srcdir/blat"     "$pkgdir/usr/bin/blat"
    install -Dm755 "$srcdir/gfServer" "$pkgdir/usr/bin/gfServer"
    install -Dm755 "$srcdir/gfClient" "$pkgdir/usr/bin/gfClient"
    install -Dm755 "$srcdir/isPcr"    "$pkgdir/usr/bin/isPcr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
