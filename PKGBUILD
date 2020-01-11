# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.1.2
pkgrel=1
pkgdesc="A graphical top clone, written in Rust. Inspired by both gtop and gotop."
makedepends=('rust' 'cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/$pkgname/archive/v$pkgver.tar.gz")
license=('MIT')
sha512sums=('5d44c7ed10baafa860cf3a76989f4760a982a9101ed12e9dc75821c7a3dbd72cd8b51d89bde4a805f5b08654000a289d927f7aa7959086478eb93061ecab3b85')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver/target/release"
    strip btm
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}