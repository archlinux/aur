# Maintainer: Ante Laurijssen <va2bbw@gmail.com>

pkgname=modem73
pkgver=2.4.2
pkgrel=1
pkgdesc='KISS TNC frontend for the aicodix OFDM modem'
arch=('x86_64')
url='https://github.com/RFnexus/modem73'
license=('Unlicense')
depends=('glibc' 'gcc-libs' 'ncurses' 'hamlib' 'hidapi')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    make -f packaging/Makefile.pkg \
        CC=gcc CXX=g++ \
        VERSION="${pkgver}" \
        ARCH_FLAGS="${CXXFLAGS} ${LDFLAGS}"
}

package() {
    cd "${pkgname}-${pkgver}"
    make -f packaging/Makefile.pkg install DESTDIR="${pkgdir}" PREFIX=/usr
}

sha256sums=('5c2c44e3b2af69f813cb9673d7943997a6a847b8ccb14a049047387fd694bcda')
