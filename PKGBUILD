# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.17.06
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
b2sums=('cb5285d5ca12957d9eab7df1e6e011be35cc87a7d43d4d99ec7433588c1c9c959ac05f97b6dde4483ed6c3ad4b9317e299e0650aa8c0cb50f5bd38f8e9bd4ace')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
