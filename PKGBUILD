# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.16.02
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
b2sums=('6db57f629b01b80e5b89febf56f00cb94611833002484f6fbe9b9afce3f4a6fd3cb9ef0631312a9924b5d24f50b9f4b5bbe54a7dadb9e98eeca0c2f0cc03ec81')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
