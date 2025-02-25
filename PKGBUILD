# Maintainer: Max Gilmour <mgilmour@maxgmr.ca>
pkgname='rcv'
pkgver=0.2.2
pkgrel=1
pkgdesc="CLI conversion between number radicies"
arch=('x86_64')
url="https://github.com/maxgmr/rcv"
license=('GPL-3.0-only')
depends=('glibc')
options=("strip" "!debug")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maxgmr/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ddf8b830929474cb39662bf7c41f7a568630a449ddc7bcf64bf63a4fe231b67')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    DESTDIR=${pkgdir}/usr make
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR=${pkgdir}/usr make install
}
