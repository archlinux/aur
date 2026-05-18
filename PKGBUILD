pkgname=aev
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal fast system fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/azytar/aev"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/azytar/aev/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50f3f019ffb9c660a7e1f97dfc23031d50d98e69a630648cbd57564ad8080a58')
options=('!debug')
build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/aev "$pkgdir/usr/bin/aev"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
