# Maintainer: FT <worldoptimizer@gmail.com>

pkgname=hp-omen-gaming-wmi-dkms
_pkgname=hp-wmi
pkgver=1.0.0
pkgrel=1
pkgdesc="HP WMI driver for OMEN Gaming laptops (unlocked TGP and board 8E35 support)"
arch=('any')
license=('GPL2')
depends=('dkms' 'linux-headers')
source=("hp-wmi.c" "Makefile" "dkms.conf")
sha256sums=('698bc594f2d73a79b4bf9293885a68e668b2b556e72996a7e3b20fd3aab3e211'
            '9b9e71d6d7ddbd1fa2c2d02dbe7521e93098f8e16569f6f9aba1e62afe4aa297'
            'b16a030893d665ed3aa638352e272bd99de54fcf04ffda02083040e811d0c81b')


build() {
    make
}

package() {
    install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -r "${srcdir}/hp-wmi.c" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
    cp -r "${srcdir}/Makefile" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
    cp -r "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
}
