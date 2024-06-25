# Maintainer: Willy Micieli <micieli@vivaldi.net>
pkgname=commiter
pkgver=1.2.1
pkgrel=1
epoch=1
arch=('any')
pkgdesc="A rust program to ensure commit quality for cargo project"
url="https://github.com/otechdo/commiter"
license=('GPL3')
depends=('rustup' 'git' 'zuu')
makedepends=('cargo')
provides=('commiter')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d8ca0cb7c2d2dc024add49b66f848e065eb6d6ce04c5b132830e60d73decba1b')


build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/commiter"
}
