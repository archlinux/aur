pkgname=wl-gammactl-rust
pkgver=0.2.0
pkgrel=1
pkgdesc="Change contrast, brightness, gamma, saturation & color temperature on Wayland"
arch=('x86_64')
url="https://github.com/Lecer69/wl-gammactl-rust"
license=('Unlicense')
depends=('wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('99f9bbe53d19cb2c0ff736161fe7806bf7fb81b6ed6f6aa0cb85ae73874d8651')

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
