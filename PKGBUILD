# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=perforator-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Continuous profiling tool designed for large data centers (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/yandex/perforator/'
license=('Apache-2.0')
provides=('perforator')
conflicts=('perforator')
options=('!debug' '!strip')
source=("perforator-cli-${pkgver}"::"https://github.com/yandex/perforator/releases/download/v${pkgver}/cli"
        "perforator-migrate-${pkgver}"::"https://github.com/yandex/perforator/releases/download/v${pkgver}/migrate")
sha256sums=('ee17c9483b5a21be293a2ce2f07abd25ef3372f75b340bbfa55dbf414c562b88'
            '98a5526374be40d77b8bca55c0b8418b8433101315be580783503e7f684fe6ca')

package() {
    install -D -m755 "perforator-cli-${pkgver}" "${pkgdir}/usr/bin/perforator-cli"
    install -D -m755 "perforator-migrate-${pkgver}" "${pkgdir}/usr/bin/perforator-migrate"
    ln -s perforator-cli "${pkgdir}/usr/bin/perforator"
}
