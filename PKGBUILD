# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphical top clone, written in Rust. Inspired by both gtop and gotop."
makedepends=('rust' 'cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/$pkgname/archive/v$pkgver.tar.gz")
license=('MIT')
sha512sums=('7a8056c8e6d2f6f17a8b2607e8042c0d9d100f26bec49dd7d5c1777665f29f117875642b174c6d4077347d6fed41f2508779d196eb2f33df97d8e230d70344a0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver/target/release"
    strip btm
    install -Dm755 btm -t "$pkgdir/usr/bin/btm"
}