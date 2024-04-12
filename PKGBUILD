# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.17.07
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
b2sums=('f56dc22ca55a3b4e9c22f179653b4f832d164fd61968af146bedd3a9242509f7ede070d5cf9392ba494025682f6dfed33bd6034244c0731716977e2179514929')

build() {
    cd $pkgname-$pkgver
    make clean && make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
