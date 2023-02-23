# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.15.04
pkgrel=1
pkgdesc="Software to stress test a computer system in various selectable ways"
arch=('x86_64')
url="https://github.com/ColinIanKing/stress-ng"
license=('GPL')
depends=(
    'apparmor'
    'judy'
    'kmod'
    'libbsd'
    'libjpeg-turbo'
    'lksctp-tools'
    'xxhash'
)
optdepends=(
    'intel-ipsec-mb: support for IPsec tests'
)
makedepends=(
    'attr'
    'keyutils'
    'libaio'
    'libcap'
    'libgcrypt'
    'libglvnd'
    'libmd'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ColinIanKing/${pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
b2sums=('32e1aa2e2d9ab42e9b5c3829c4cc313688158089d0caccc275df4dcd3160830313acae8cd4ba9a3e513627714124669f7181566485373ac77b86591ae1bcb729')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
