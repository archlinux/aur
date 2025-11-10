# Maintainer: Batjigdrel Bataa <jiji-wp@proton.me>

pkgname=daph
pkgver=0.0.3
pkgrel=1
pkgdesc="A music player in the terminal. Written in Rust."
arch=('x86_64')
url="https://codeberg.org/jiji-wp/daph"
license=('Apache-2.0')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jiji-wp/daph/archive/v${pkgver}.tar.gz")

sha256sums=('768aa41e9ee63171338b21f2e3e1ec7ac8ff778f834bd60849d85fd78fbba184')

package() {
    cd "$srcdir/$pkgname"
    cargo build --release
    install -Dm755 target/release/daph "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
