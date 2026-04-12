# Maintainer: Stephanie M. shteppi@dorcus.digital
# AUR Package for Fluxer TUI 0.6.9
pkgname=fluxer-tui
pkgver=0.6.10
pkgrel=1
pkgdesc="A terminal-based chat client for the Fluxer messaging platform"
arch=('x86_64')
url="https://github.com/dogbonewish/fluxer-tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dogbonewish/fluxer-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b6836d95f054b1b3f03b5816d87336238dcd2d3ae1b83ca010a33eb8a0dba2a')

build() {
    cd "$srcdir/fluxer-tui-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/fluxer-tui-$pkgver"
    install -Dm755 "target/release/fluxer-tui" "$pkgdir/usr/bin/fluxer-tui"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
