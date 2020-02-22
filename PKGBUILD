# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.2.1
pkgrel=1
pkgdesc="Yet another cross-platform graphical process/system monitor."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_source_code.tar.gz")
license=('MIT')
sha512sums=('b9fe000e9789f0f20c82fc5c37c478d7fd53f355eccc87304dbc8a2066a9bfaa0d3ad2ffad74f5dc64e39db35fac754ce73d18d558874c45e161dd93ffbb1c00')

build() {
    cargo build --release
}

package() {
    #install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    strip btm
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}