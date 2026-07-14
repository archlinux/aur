pkgname=wl-gammactl-rust
pkgver=0.1.0
pkgrel=1
pkgdesc="Change contrast, brightness, gamma & saturation on Wayland"
arch=('x86_64')
url="https://github.com/Lecer69/wl-gammactl-rust"
license=('Unlicense')
depends=('wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bed0182ac859317ff5c2c8aa3e2b0a94774b5bc771814d32cef951aae52e8391')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}