# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.17.08
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
b2sums=('ca5c00eebbefeb5be90756faa41f8130b577ca71b78253dc4ae431df1044366e79882e0e1c0850c0102e83356203400295fad977d141dddaf234423617cec965')

build() {
    cd $pkgname-$pkgver
    make clean && make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
