# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname=rconc
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple cross-platform RCON client written in rust'
arch=('i686' 'x86_64')
url='https://github.com/klemens/rconc'
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cb6f193b92f19e9302edd31afa42d00e0cd873e1afa4472388e6e3d9d6727607')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
