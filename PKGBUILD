# Maintainer: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.8.2
pkgrel=2
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://gitlab.com/jD91mZM2/xidlehook"
arch=("x86_64" "aarch64")
license=("MIT")
makedepends=("rust" "libxss" "python")
optdepends=()
depends=("libpulse")
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('de078de1618c21f430bfdd6dfbb55e6f66222efb0ba2ebc718cdb06b464d45f0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$pkgname"{,-client}
}
