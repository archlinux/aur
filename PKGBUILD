# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.16.05
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
    'libglvnd'
    'libjpeg-turbo'
    'lksctp-tools'
    'mpfr'
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
b2sums=('41aabb35ac8f00899dfea144a368f0a7f625c4631d341bd456f3a9bdb1f28b1975ec960ebe81935fcb27df7019c07bbe8c3ad43a698a19e65a6ce2da7bac1bda')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
