# Maintainer: caputmanus <caputmanus@outlook.com>
pkgname=aware
pkgver=0.1.4
pkgrel=1
pkgdesc="Simple process supervisor in Rust"
arch=('x86_64')
url="https://github.com/spice-itself/aware"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/spice-itself/aware.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/aware"
    cargo build --release
}

package() {
    cd "$srcdir/aware"
    install -Dm755 "target/release/aware" "$pkgdir/usr/bin/aware"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/aware/README.md"
}

