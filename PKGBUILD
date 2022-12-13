# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.15.01
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
b2sums=('72eda17c45f232644cb070078df2b2e0221f13762bda0336f3e0ac2f69bd6a1b50f7f94009678943f007f58b76981de8eaa67272170e70c7631b3ba34f9a9dd7')

build() {
    cd "${pkgname}-${pkgver}"
    make clean && make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
