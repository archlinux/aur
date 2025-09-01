# Maintainer: Reazn ruby.florian@proton.me
pkgname=copycontent
pkgver=1.0.0
pkgrel=1
pkgdesc="Quick CLI tool to copy file contents to clipboard"
arch=('x86_64')
url="https://github.com/reazndev/CopyContent"
license=('MIT')
depends=('wl-clipboard')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "CopyContent-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "CopyContent-$pkgver"
    install -Dm0755 "target/release/cct" "$pkgdir/usr/bin/cct"
}
