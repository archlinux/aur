# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasm-pack
pkgver=0.9.1
pkgrel=1
pkgdesc="Your favorite rust -> wasm workflow tool!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/rustwasm/wasm-pack"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/rustwasm/wasm-pack/archive/v${pkgver}.tar.gz")
sha384sums=('b01cdf34ea43e0fed215f53084cdec33a090d0e69e97017b35d4c1967872c420da242e2d9e470a0d7db2ae435e428ab5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
