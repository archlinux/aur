# Maintainer: Max Gilmour <mgilmour@maxgmr.ca>
pkgname='rcv'
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI conversion between number radicies"
arch=('x86_64')
url="https://github.com/maxgmr/rcv"
license=('GPL-3.0-only')
depends=('glibc')
options=("strip" "!debug")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maxgmr/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30be37e9c1b0de7f959f218e1ed88f64cf915b77bec2e04fffdd957a4efab661')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    DESTDIR=${pkgdir}/usr make
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR=${pkgdir}/usr make install
}
