# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mooltipass-udev
pkgver=2018042101
pkgrel=1
pkgdesc="Udev rules to connect Mooltipass devices"
arch=('any')
url="https://github.com/mooltipass/mooltipass-udev"
license=('GPL3')

depends=('libusb'
         'udev')

validpgpkeys=('3486CBAC7F116CA71351B0D7F7181B2010660E6F')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('5d12b36ff192d9ece11597e8cb23ca47fb237deeba395bb792c75d859cfa4f76'
            '8f56f520aa25b73aca882c0237d9b7390f4aa951c2bebcf413bed680a0baba23')

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"

        install -Dm 644 udev/69-mooltipass.rules "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
}
