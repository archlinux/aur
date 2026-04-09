# Maintainer: crl <crl18039102576@126.com>

pkgname=nvcomp
pkgver=5.2.0.10
pkgrel=2
pkgdesc="NVIDIA nvCOMP is a high-speed data compression and decompression library optimized for NVIDIA GPUs."
url="https://developer.nvidia.com/nvcomp"
arch=('x86_64')
license=('custom')
depends=('libgcc' 'libstdc++' 'cuda')
source=("https://developer.download.nvidia.com/compute/nvcomp/redist/nvcomp/linux-x86_64/nvcomp-linux-x86_64-${pkgver}_cuda13-archive.tar.xz")
sha256sums=('2dd6c184c79fa5402c9b63a274e778d4b52e8d736ee927da81f07c1f8bed12ff')


package() {
    cd "$srcdir/nvcomp-linux-x86_64-${pkgver}_cuda13-archive"
    
    mkdir -p "$pkgdir/usr"
    cp -r include "$pkgdir/usr"
    cp -r lib "$pkgdir/usr"
    cp -r bin "$pkgdir/usr"

    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
