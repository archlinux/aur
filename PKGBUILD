# Maintainer: Willy Micieli <micieli@vivaldi.net>
pkgname=commiter
pkgver=1.0.0
pkgrel=2
epoch=1
arch=('any')
pkgdesc="A rust program to ensure commit quality for cargo project"
url="https://github.com/otechdo/commiter"
license=('GPL3')
depends=('rustup' 'git' 'zuu')
makedepends=('cargo')
provides=('commiter')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('5797a91dbf9ae2a68556c018bc098a430237ab163fb564485067ff469cf23352')


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
