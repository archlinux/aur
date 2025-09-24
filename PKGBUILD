# Maintainer: crl <crl18039102576@126.com>

pkgname=nvcomp
pkgver=5.0.0.6
pkgrel=1
pkgdesc="NVIDIA nvCOMP is a high-speed data compression and decompression library optimized for NVIDIA GPUs."
url="https://developer.nvidia.com/nvcomp"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'cuda')
source=("https://developer.download.nvidia.com/compute/nvcomp/redist/nvcomp/linux-x86_64/nvcomp-linux-x86_64-${pkgver}_cuda13-archive.tar.xz")
sha256sums=('4166e7c3825fa90139d50042154438ba06ea493985aeb7968fc1ad0d5fa5a22a')


package() {
    cd "$srcdir/nvcomp-linux-x86_64-${pkgver}_cuda13-archive"
    
    mkdir -p "$pkgdir/usr"
    cp -r include "$pkgdir/usr"
    cp -r lib "$pkgdir/usr"

    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
