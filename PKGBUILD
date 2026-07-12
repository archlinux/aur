# Maintainer: Kai <me@kaizarzycki.com>
pkgname=rand-ms
pkgver=0.1.0
pkgrel=1
pkgdesc="A small Rust CLI tool for randomly selecting items from a Bandcamp-style wishlist within a monthly budget"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://gitlab.com/kaizarzycki/rand-ms"
license=('MIT')
makedepends=('cargo')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('db613c8923f438936823adcfc38ec35ed26638380c333d0d348bd672bd612ed4')

build() {
    cd "$pkgname-v$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

