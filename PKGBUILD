# Maintainer: Batjigdrel Bataa <jiji-wp@proton.me>

pkgname=daph
pkgver=0.0.4
pkgrel=1
pkgdesc="A music player in the terminal. Written in Rust."
arch=('x86_64')
url="https://codeberg.org/jiji-wp/daph"
license=('Apache-2.0')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jiji-wp/daph/archive/v${pkgver}.tar.gz")

sha256sums=('5ccfd4f0265bf15f8c62149e0b007f898c6f894feea9033ce492ed6b325ec252')

package() {
    cd "$srcdir/$pkgname"
    cargo build --release
    install -Dm755 target/release/daph "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
