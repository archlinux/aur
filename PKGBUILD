pkgname=wl-gammactl-rust
pkgver=0.2.2
pkgrel=1
pkgdesc="Change contrast, brightness, gamma, saturation & color temperature on Wayland"
arch=('x86_64')
url="https://github.com/Lecer69/wl-gammactl-rust"
license=('Unlicense')
depends=('wayland')
makedepends=('cargo')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b35fb4b06e08317a0c72c4a3229364b6e37d96152ef3f7d256ff08b54d406852')
options=('!debug')

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
