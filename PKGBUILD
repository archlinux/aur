# Maintainer: Alejandro Quintanar
pkgname=term39
pkgver=0.15.3
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation."
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alejandroqh/term39/archive/v$pkgver.tar.gz")
sha256sums=('7222ff08dffd06061c18475b0fbaa00c921a4b96c0b3511a1f487fc22587c66c')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
