# Maintainer: Sven Rademakers <sven@turingpi.com>

pkgname=tpi
pkgver=0.2.1
pkgrel=1
pkgdesc='CLI tool to control a Turing-Pi board'
url=https://turingpi.com/
license=('Apache')
makedepends=('cargo')
arch=('any')
source=('https://github.com/turing-machines/tpi/archive/refs/tags/v0.2.1.tar.gz')
prepare() {
    cd $srcdir/tpi-0.2.1
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/tpi-0.2.1 && cargo build --frozen --release
}
check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/tpi-0.2.1 && cargo test --frozen
}
package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/tpi-0.2.1/target/release/tpi"
}
md5sums=('f5c36aa25852cc9ce7c985b314f9c62a')
md5sums=('f5c36aa25852cc9ce7c985b314f9c62a')
