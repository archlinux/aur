# Maintainer: Muhammad Faizan <mfkhalil683@gmail.com>
pkgname=zapreq
pkgver=0.1.5
pkgrel=1
pkgdesc="A fast, friendly HTTP client for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/MFAIZAN20/zapreq"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MFAIZAN20/zapreq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35978b83c48f8c0e86af60623dee7f38de1711a41027f534b896f95776168da5')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/zapreq" \
        "$pkgdir/usr/bin/zapreq"
    install -Dm644 LICENSE-MIT \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
