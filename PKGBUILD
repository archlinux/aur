# Maintainer: Kai <me@kaizarzycki.com>
pkgname=rand-ms
pkgver=0.2.1
pkgrel=1
pkgdesc="A small Rust CLI tool for randomly selecting items from a Bandcamp-style wishlist within a monthly budget"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://gitlab.com/kaizarzycki/rand-ms"
license=('MIT')
makedepends=('cargo')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

build() {
    cd "$pkgname-v$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=('98804a5164d03ce9af0bf03684a535ff2abd26adc36f79b1e967212dae8a298e')
