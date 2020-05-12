# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.4.2
pkgrel=0
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_required_files.tar.gz")
license=('MIT')
sha512sums=('ec9af9f1ecb5987fe0bb14c591a3d0b1546dbb72f55f8d0d14819006b5a055715b6dc8287fdcce37ed6070222f7198d512c214140b431002fe29386f4574dae6')

build() {
    cargo build --release --locked
}

package() {
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}