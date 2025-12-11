# Maintainer: crl <crl18039102576@126.com>

pkgname=nvcomp
pkgver=5.1.0.21
pkgrel=1
pkgdesc="NVIDIA nvCOMP is a high-speed data compression and decompression library optimized for NVIDIA GPUs."
url="https://developer.nvidia.com/nvcomp"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'cuda')
source=("https://developer.download.nvidia.com/compute/nvcomp/redist/nvcomp/linux-x86_64/nvcomp-linux-x86_64-${pkgver}_cuda13-archive.tar.xz")
sha256sums=('2b3e2d0cd62e9185868359802550612deecf3cb9efe5f3e190ef2b64d4cb1957')


package() {
    cd "$srcdir/nvcomp-linux-x86_64-${pkgver}_cuda13-archive"
    
    mkdir -p "$pkgdir/usr"
    cp -r include "$pkgdir/usr"
    cp -r lib "$pkgdir/usr"

    rm -rf "$pkgdir/usr/lib/libnvcomp_cpu_static.a"
    rm -rf "$pkgdir/usr/lib/libnvcomp_static.a"

    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
