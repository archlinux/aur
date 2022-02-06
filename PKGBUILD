# Maintainer: Никола Милинковић <nikola.milinkovic@disroot.org>

_pkgname='bcm2-utils'
pkgname="${_pkgname}-git"
pkgver=0.9.5.1.r58.g69037f2
pkgrel=1
pkgdesc="Utilities for Broadcom-based cable modems"
arch=('x86_64')
url="https://github.com/jclehner/bcm2-utils"
license=('GPL3')
depends=('openssl' 'gcc-libs')
makedepends=('git')
optdepends=()
provides=('bcm2-utils')
conflicts=('bcm2-utils')
source=('git+https://github.com/jclehner/bcm2-utils.git')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    make
}

package() {
    cd "${_pkgname}"
    install -m755 -d "${pkgdir}/usr/bin"
    make PREFIX="${pkgdir}/usr" install
}
