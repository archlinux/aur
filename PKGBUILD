# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=xi-core
pkgver=0.3.0
pkgrel=1
pkgdesc='A modern editor with a backend written in Rust'
arch=('x86_64' 'i686')
url='https://github.com/google/xi-editor'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("https://github.com/xi-editor/xi-editor/archive/v0.3.0.tar.gz")
sha256sums=('e42998ad9b6d6df0f797afd005f9c1286aad24c30a77d0dd380730c248274b8d')


build() {
    cd "xi-editor-${pkgver}/rust"
    cargo build --release --locked --all-features
}

check() {
    cd "xi-editor-${pkgver}/rust"
    cargo test --release --locked
}

package() {
    cd "xi-editor-${pkgver}/rust"
    install -Dm 755 "target/release/xi-core" -t "$pkgdir/usr/bin"
}
