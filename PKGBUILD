# Maintainer: Sammy <shaughn.chan@gmail.com>
pkgname=cogsy
pkgver=0.2.2
pkgrel=1
pkgdesc='TUI-based Discogs collection tracker'
arch=('x86_64')
url="https://github.com/cartoon-raccoon/cogsy"
license=("LGPL2")
conflicts=("cogsy")
depends=('openssl' 'sqlite3' 'ncurses')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cartoon-raccoon/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7502e9e71e1760e0835ebcc4997b1f3cf992ce34c9fc534a7125e8c5746c1ef6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/cogsy "${pkgdir}/usr/bin/cogsy"
}
