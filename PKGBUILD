# Maintainer: Luna
pkgname=uwu
pkgver=1.0.0
pkgrel=1
pkgdesc="A basic AUR helper written in Rust."
arch=('x86_64')
url="https://github.com/Luca-Barra/uwu"
license=('MIT')
depends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Luca-Barra/uwu/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/uwu" "$pkgdir/usr/bin/uwu"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test
}