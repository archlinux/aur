# Maintainer: Willy Micieli <micieli@vivaldi.net>
pkgname=commiter
pkgver=2.0.0
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
sha256sums=('12fe1e4a7d4270b4a5379871981c0e67f0ce090c46091d2718998c8d90cd75d6')


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
