# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasm-pack
pkgver=0.10.2
pkgrel=1
pkgdesc="Your favorite rust -> wasm workflow tool!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/rustwasm/wasm-pack"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/rustwasm/wasm-pack/archive/v${pkgver}.tar.gz")
sha384sums=('61886496539a75489bad879980d9e129bf04843bdca6c1368861048a740815526300c2daae0d5f6b4a44cce02ca9f21a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --target-dir "$(pwd)/target"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
