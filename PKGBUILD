# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Prebuilt UCSC Genome Browser binaries. Upstream files are unversioned, so
# pkgver is the newest HTTP Last-Modified date (YYYYMMDD) across the group.

pkgname=ucsc-bigwig-bin
pkgver=20260407
pkgrel=1
pkgdesc="UCSC bigWig format utilities: wigToBigWig, bedGraphToBigWig, bigWigToBedGraph, bigWigInfo, bigWigAverageOverBed, bigWigSummary, fetchChromSizes"
arch=('x86_64')
url="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/"
license=('MIT')
# curl is needed by the fetchChromSizes helper script, not the binaries.
depends=('glibc' 'curl')
options=('!strip' '!debug')
source=("https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigToBedGraph"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigInfo"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigAverageOverBed"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigSummary"
        "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/fetchChromSizes"
        "LICENSE::https://raw.githubusercontent.com/ucscGenomeBrowser/kent/master/LICENSE")
sha256sums=('1a1527cf364e1e572a81c7284fc9ccd2b3690b5896baa5b57399864f85ad7771'
            'ff5fe900999fb55a0316466363637c6f2f492187543222e679b985ba5db3507f'
            '22f22e03e6c91561e2bdfa7f967e6e8a60ba7a9b3a7b09ef051162e7bcb90bed'
            '1fb4e7edbfbcfe79edd8b27af0c1ac29277b1f65f28a88f57558bf903da5b8b0'
            '77176ee93c01512f75c4a0b998ac39c35de8c694760dfab95e015ed871f32836'
            '4e05a2eb93165dff250a44b5fd89b4ac2460cfb2dc5a170f7ab8c668542c9867'
            '2fb9a503bb119e6c19ac874f9923c6fb7d7aeea8a099afa94b794704383d1a21'
            '793d774ec3941d88d5f93611639230030ea3e167282be144b6e5604bc5ad29a4')

package() {
    install -Dm755 "$srcdir/bedGraphToBigWig"    "$pkgdir/usr/bin/bedGraphToBigWig"
    install -Dm755 "$srcdir/wigToBigWig"         "$pkgdir/usr/bin/wigToBigWig"
    install -Dm755 "$srcdir/bigWigToBedGraph"    "$pkgdir/usr/bin/bigWigToBedGraph"
    install -Dm755 "$srcdir/bigWigInfo"          "$pkgdir/usr/bin/bigWigInfo"
    install -Dm755 "$srcdir/bigWigAverageOverBed" "$pkgdir/usr/bin/bigWigAverageOverBed"
    install -Dm755 "$srcdir/bigWigSummary"       "$pkgdir/usr/bin/bigWigSummary"
    install -Dm755 "$srcdir/fetchChromSizes"     "$pkgdir/usr/bin/fetchChromSizes"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
