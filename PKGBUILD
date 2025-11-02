# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=perforator-bin
pkgver=0.0.7
pkgrel=1
pkgdesc='Continuous profiling tool designed for large data centers (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/yandex/perforator/'
license=('Apache-2.0')
depends=(
    'glibc')
provides=('perforator')
conflicts=('perforator')
options=('!debug' '!strip')
source=("perforator-cli-${pkgver}"::"https://github.com/yandex/perforator/releases/download/v${pkgver}/cli"
        "perforator-migrate-${pkgver}"::"https://github.com/yandex/perforator/releases/download/v${pkgver}/migrate")
sha256sums=('3751f012b08261e088fa8d1a584c5d26903165fb80ebb12e244a815f597ba1eb'
            'ba623e943a2dbf6254e09e569bea471b50528e583c8a890d21ad0ad944408ba1')

package() {
    install -D -m755 "perforator-cli-${pkgver}" "${pkgdir}/usr/bin/perforator-cli"
    install -D -m755 "perforator-migrate-${pkgver}" "${pkgdir}/usr/bin/perforator-migrate"
    ln -s perforator-cli "${pkgdir}/usr/bin/perforator"
}
