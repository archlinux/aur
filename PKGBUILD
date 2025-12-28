# Maintainer: runa <runa-dev@proton.me>
pkgname=runa
_pkgname=runa-tui
pkgver=0.3.4
pkgrel=2
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha256sums=('26c3d351d444ae8c2cb88ce93ea15b61d0d54cbebc0f0d764c2f4e662ae2bd03')

build() {
    cd "$_pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "target/release/rn" "$pkgdir/usr/bin/rn"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
