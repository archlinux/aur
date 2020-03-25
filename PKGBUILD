# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname=rconc
pkgver=0.1.3
pkgrel=1
pkgdesc='Simple cross-platform RCON client written in rust'
arch=('x86_64')
url='https://github.com/klemens/rconc'
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d81f746404bf8c1cbac82d36a49ad3e2d087b5e09a96ba8afeebf86e08c9d76d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
