# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.2.0
pkgrel=1
pkgdesc="Yet another cross-platform graphical process/system monitor."
makedepends=('rust' 'cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_source_code.tar.gz")
license=('MIT')
sha512sums=('c8d2041fc6343e10e7a6ca2c7951d14b9c756f48a6f6c1ef3fec2bf2315c9e62098fe1efda87166d5f5a9a113bd945ea636e73540d7f30f83148b4dd6c3b985f')

build() {
    cargo build --release
}

package() {
    cd "./target/release"
    strip btm
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}