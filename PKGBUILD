# Maintainer: Muhammad Faizan <mfkhalil683@gmail.com>
pkgname=zapreq
pkgver=0.1.4
pkgrel=1
pkgdesc="A fast, friendly HTTP client for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/MFAIZAN20/zapreq"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MFAIZAN20/zapreq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6e6ba817eaf463ac4c020dfc580a3348f351aaae9da8dae5f47b6f150579bfc')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/http" \
        "$pkgdir/usr/bin/http-zapreq"
    install -Dm644 LICENSE-MIT \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
