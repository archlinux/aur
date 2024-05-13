# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=smemstat
pkgver=0.02.13
pkgrel=1
pkgdesc="Smemstat reports the physical memory usage taking into consideration shared memory."
arch=("any")
url="https://github.com/ColinIanKing/smemstat"
license=("GPL-2.0-or-later")
depends=("ncurses")
makedepends=("gcc")
provides=("smemstat")
conflicts=("smemstat")
source=("https://github.com/ColinIanKing/${pkgname}/archive/refs/tags/V${pkgver}.zip")
b2sums=('5a23966d5e77300f43a06a0bf327bd0b5478186b7943e06bc41d0048c22dd302e05cfaa4f79bfa892a1e6e1e19fa857ea641eeb89b031d0f4e6f925cce643a66')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir"
}
