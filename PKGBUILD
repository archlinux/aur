# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname=rconc
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple cross-platform RCON client written in rust'
arch=('i686' 'x86_64')
url='https://github.com/klemens/rconc'
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bc2c7fa92f9fe107e0745e3a758665d6b67e05f04b3d4ed2158cfa5c279fbfd8')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
