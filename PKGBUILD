# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=orffinder
pkgver=0.4.3
pkgrel=1
pkgdesc="NCBI ORFfinder: finds Open Reading Frames (ORFs) in a query sequence"
arch=('x86_64')
url="https://www.ncbi.nlm.nih.gov/orffinder/"
license=('Public Domain')
depends=('zlib' 'bzip2' 'xz' 'zstd' 'libuv' 'libnghttp2' 'elfutils')
options=('!strip' '!debug')
# Single gzipped ELF binary; upstream filename is unversioned.
source=("ORFfinder-${pkgver}.gz::https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz")
sha256sums=('f30a0806b984931a967d8024066a53dbb811035ca14564f36f7f7045a6a509f2')
noextract=("ORFfinder-${pkgver}.gz")

package() {
    cd "$srcdir"
    gunzip -c "ORFfinder-${pkgver}.gz" > ORFfinder
    install -Dm755 ORFfinder "$pkgdir/usr/bin/ORFfinder"
}
