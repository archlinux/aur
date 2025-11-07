# Maintainer: Batjigdrel Bataa <jiji-wp@proton.me>

pkgname=daph
pkgver=0.0.17
pkgrel=1
pkgdesc="A music player in the terminal. Written in Rust."
arch=('x86_64')
url="https://codeberg.org/jiji-wp/daph"
license=('Apache-2.0')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jiji-wp/daph/archive/v${pkgver}.tar.gz")

sha256sums=('746c57be3c75d0ff5b5d9d99d53951833590b3e938418235149defe3fb8d28c1')

package() {
    cd "$srcdir/$pkgname"
    cargo build --release
    install -Dm755 target/release/daph "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
