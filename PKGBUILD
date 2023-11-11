# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.17.01
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
b2sums=('37fbee68094dc4d840a804bd9256bc51341c4daa199b99cd008cb0675edadb2ac2e69efb6dedb7b089af115d5299d373df8b9977361eaa547132f9192954bfb6')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
