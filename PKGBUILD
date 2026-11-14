# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=perforator-bin
pkgver=0.2.1
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
sha256sums=('37d3aca6e132839a78e4605c0611e2e535c00337e4025b78fc653a584e7e1b8b'
            'a00cce83cf81f6bad57453cbac49986aa508c2414b67f0e6c957c7f6022e73cd')

package() {
    install -D -m755 "perforator-cli-${pkgver}" "${pkgdir}/usr/bin/perforator-cli"
    install -D -m755 "perforator-migrate-${pkgver}" "${pkgdir}/usr/bin/perforator-migrate"
    ln -s perforator-cli "${pkgdir}/usr/bin/perforator"
}
