# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasm-pack
pkgver=0.10.0
pkgrel=1
pkgdesc="Your favorite rust -> wasm workflow tool!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/rustwasm/wasm-pack"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/rustwasm/wasm-pack/archive/v${pkgver}.tar.gz")
sha384sums=('351ca0996f8304060a11243db1100f1f2ac8fe8b8f26ccc7279460e686d96eb3262a92769d0a8b6e4113732965f185f0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --target-dir "$(pwd)/target"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
