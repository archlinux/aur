# Maintainer: Sammy <shaughn.chan@gmail.com>
pkgname=cogsy
pkgver=0.2.1
pkgrel=1
pkgdesc='TUI-based Discogs collection tracker'
arch=('x86_64')
url="https://github.com/cartoon-raccoon/cogsy"
license=("LGPL2")
conflicts=("cogsy")
depends=('openssl' 'sqlite3' 'ncurses')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cartoon-raccoon/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('506f5dd2d87244b85d0701c153b11ec90c462f4675826c7fa9d19f1258725465')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/cogsy "${pkgdir}/usr/bin/cogsy"
}
