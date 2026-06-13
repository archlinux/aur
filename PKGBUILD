# Maintainer: Germanphoneguy <germanTECH@web.de>

pkgname=8fetch
pkgver=2
pkgrel=2
pkgdesc="Blazing fast system fetch tool — Rust port, 8x faster than fastfetch"
arch=('x86_64' 'aarch64')
url="https://github.com/germanphoneguy/eightfetch"
license=('MIT')
makedepends=('cargo' 'git')

source=("git+https://github.com/germanphoneguy/eightfetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/eightfetch"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/eightfetch"
    cargo build --release --locked
}

package() {
    cd "$srcdir/eightfetch"
    install -Dm755 target/release/8fetch "$pkgdir/usr/bin/8fetch"
}
