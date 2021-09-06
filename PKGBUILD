# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasm-pack
pkgver=0.10.1
pkgrel=1
pkgdesc="Your favorite rust -> wasm workflow tool!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/rustwasm/wasm-pack"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/rustwasm/wasm-pack/archive/v${pkgver}.tar.gz")
sha384sums=('1d76ad08a53a2e691fd503012c1f829442c3cffaf03c76f286b7ce4dff0d7d5431905ca05474386e14ed21d6be2e3a7e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --target-dir "$(pwd)/target"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
