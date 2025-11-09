# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=prmt
pkgver=0.1.7
pkgrel=1
pkgdesc="Ultra-fast, customizable shell prompt generator"
arch=('x86_64')
url="https://github.com/3axap4eHko/prmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('prmt-git')
provides=('prmt')
replaces=('prmt-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65569bf5e6ad0cb56f9a9591f21fc3a2b0bc50450b16fa3c09b722f34e629175')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/prmt" "$pkgdir/usr/bin/prmt"
}
