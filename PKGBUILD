# Maintainer: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.9.1
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://gitlab.com/jD91mZM2/xidlehook"
arch=("x86_64" "aarch64")
license=("MIT")
makedepends=("rust" "libxss" "python")
optdepends=()
depends=("libpulse")
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3ad93080cf8114d2a9521f9288a09e351a54630f70d2d8cd87beb5f5e3f1f8b1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$pkgname"{,-client}
}
