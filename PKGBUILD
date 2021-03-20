# Maintainer: Sammy <shaughn.chan@gmail.com>
pkgname=cogsy
pkgver=0.2.0
pkgrel=1
pkgdesc='TUI-based Discogs collection tracker'
arch=('x86_64')
url="https://github.com/cartoon-raccoon/cogsy"
license=("LGPL2")
depends=('openssl' 'sqlite3' 'ncurses')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cartoon-raccoon/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e07bdc5eaad6d288426cc1c7902e8bab704cf38ee17b9e48d3c600dc61c1eae0')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/cogsy "${pkgdir}/usr/bin/cogsy"
}
