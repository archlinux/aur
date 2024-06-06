# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.18.00
pkgrel=1
pkgdesc="Software to stress test a computer system in various selectable ways"
arch=(x86_64)
url=https://github.com/ColinIanKing/stress-ng
license=(GPL-2.0-only)
depends=(
    apparmor
    gmp
    judy
    kmod
    libbsd
    libglvnd
    libjpeg-turbo
    lksctp-tools
    mpfr
    xxhash
)
optdepends=(
    'intel-ipsec-mb: support for IPsec tests'
    'linux-headers: include some headers from the Arch kernel'
    'linux-lts-headers: include some headers from the LTS kernel'
    'linux-zen-headers: include some headers from the ZEN kernel'
    'linux-hardened-headers: include some headers from the HARDENED kernel'
)
makedepends=(
    attr
    eigen
    keyutils
    libaio
    libcap
    libgcrypt
    libglvnd
    libmd
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz)
b2sums=('4f593360c2c97fc3d9cc3437d6fe89f4310281a7f90926109d0879b95068109d7e229c40e1a6f3696480309e715d77a914592eeb0a7a2ae95dc2b63c556afbd1')

build() {
    cd $pkgname-$pkgver
    make clean && make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
