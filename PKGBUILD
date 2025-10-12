# Maintainer: Your Name <your.email@example.com>

pkgname=prayers-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="TUI application to display Islamic prayer times based on your location"
arch=('x86_64' 'aarch64')
url="https://github.com/fuad-daoud/prayers"
license=('MIT')
provides=()
conflicts=()
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/prayers-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/prayers-linux-arm64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    # Install the binary with the correct name based on architecture
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/prayers"
    elif [ "$CARCH" = "aarch64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/prayers"
    fi
}
