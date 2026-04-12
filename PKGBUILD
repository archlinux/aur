# Maintainer: Stephanie M. shteppi@dorcus.digital
# AUR Package for Fluxer TUI 0.6.9
pkgname=fluxer-tui
pkgver=0.6.9
pkgrel=1
pkgdesc="A terminal-based chat client for the Fluxer messaging platform"
arch=('x86_64')
url="https://github.com/dogbonewish/fluxer-tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'clang' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dogbonewish/fluxer-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5024193a96d64494634b19356c414fb68b791dc1ad995e99117b526e036df6b1')

build() {
    cd "$srcdir/fluxer-tui-$pkgver"
    export CC=gcc
    cargo build --release --locked
}

package() {
    cd "$srcdir/fluxer-tui-$pkgver"
    install -Dm755 "target/release/fluxer-tui" "$pkgdir/usr/bin/fluxer-tui"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
