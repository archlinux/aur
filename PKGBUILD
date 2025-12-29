# Maintainer: alexm-dev <runa-dev@proton.me>
pkgname=runa
_pkgname=runa-tui
pkgver=0.3.5
pkgrel=1
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha256sums=('e06bb6881476a2f9711a9ad009db2252c574056561c42b59837d3d1a50b38207')

build() {
    cd "$_pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "target/release/rn" "$pkgdir/usr/bin/rn"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
