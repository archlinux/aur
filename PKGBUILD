# Maintainer: crl <crl18039102576@126.com>

pkgname=nvcomp
pkgver=4.2.0.11
pkgrel=1
pkgdesc="NVIDIA nvCOMP is a high-speed data compression and decompression library optimized for NVIDIA GPUs."
url="https://developer.nvidia.com/nvcomp"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'cuda')
source=("https://developer.download.nvidia.com/compute/nvcomp/redist/nvcomp/linux-x86_64/nvcomp-linux-x86_64-${pkgver}_cuda12-archive.tar.xz")
sha256sums=('0e235903b08f0173835b204e9fa90208660c33eb6a986ec178bb05ea891d5119')


package() {
    cd "$srcdir/nvcomp-linux-x86_64-${pkgver}_cuda12-archive"
    
    mkdir -p "$pkgdir/usr"
    cp -r include "$pkgdir/usr"
    cp -r lib "$pkgdir/usr"

    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
