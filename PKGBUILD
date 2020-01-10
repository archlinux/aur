# Maintainer: Clement Tsang <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphical top clone, written in Rust. Inspired by both gtop and gotop."
makedepends=('rust' 'cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/$pkgname/archive/v$pkgver.tar.gz")
license=('MIT')
sha512sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --target=x86_64-unknown-linux-gnu
}

check() {
    cargo test --target=x86_64-unknown-linux-gnu --verbose
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/btm "$pkgdir/usr/bin/btm"
}