# Maintainer: Willy Micieli <micieli@vivaldi.net>
pkgname=commiter
pkgver=1.3.0
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
sha256sums=('c9a1513924e0807626ccfd134149bfd417d5e8bc2898896634f5b0502fa92142')


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
