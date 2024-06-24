# Maintainer: Willy Micieli <micieli@vivaldi.net>
pkgname=cloning
pkgver=2.0.0
pkgrel=1
epoch=1
arch=('any')
pkgdesc="A rust program to clone directory content"
url="https://github.com/otechdo/cloning"
license=('GPL3')
depends=('rustup')
makedepends=('cargo')
provides=('cloning')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f15d612b9b1a8a61993b474de9e07b6ad9964fda2f5748a845f10d053f795297')


build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/cloning"
}
