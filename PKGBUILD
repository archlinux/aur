# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.4.3
pkgrel=1
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_required_files.tar.gz")
license=('MIT')
sha512sums=('3629738bcc923cb20929a14544aac7bbb6af53ea04c38e947be8b2d4e4658ffae620d8f9c5904e032055bc8d481a5e4b1660f106f646af9617fda1045e9f7fbd')

build() {
    cargo build --release --locked
}

package() {
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}