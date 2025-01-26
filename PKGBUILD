# Maintainer: LJ <aur.lj at munally.com>

pkgname=crates-lsp-git
pkgver=0.1.4
pkgrel=1
pkgdesc="Language Server implementation for Cargo.toml"
arch=('x86_64')
url="https://github.com/MathiasPius/crates-lsp"
license=('MIT')
makedepends=('cargo')
source=("git+$url#tag=v$pkgver")
b2sums=('SKIP')

build() {
    cd "$srcdir/crates-lsp"
    cargo build --release
}

package() {
      install -Dm755 "$srcdir/crates-lsp/target/release/crates-lsp" "$pkgdir/usr/bin/crates-lsp"
}
