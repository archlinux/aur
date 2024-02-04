# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.17.05
pkgrel=1
pkgdesc="Software to stress test a computer system in various selectable ways"
arch=('x86_64')
url="https://github.com/ColinIanKing/stress-ng"
license=('GPL-2.0-only')
depends=(
    'apparmor'
    'gmp'
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
    'linux-headers: include some headers from the Arch kernel'
    'linux-lts-headers: include some headers from the LTS kernel'
    'linux-zen-headers: include some headers from the ZEN kernel'
    'linux-hardened-headers: include some headers from the HARDENED kernel'
)
makedepends=(
    'attr'
    'eigen'
    'keyutils'
    'libaio'
    'libcap'
    'libgcrypt'
    'libglvnd'
    'libmd'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ColinIanKing/${pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
b2sums=('3fb5f633a6b8d23cbc91a2960606b3cc603c0b0656facb95e38474b0c991bd6bd59c8767a883d86e0799b34baf047db7a90902acfddd83d73f3d0652ca73e9e3')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
