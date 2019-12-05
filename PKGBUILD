# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mooltipass-udev
pkgver=2019120501
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
sha256sums=('da18bba623890cfab6903c4f7872899693aee9eb1d13a3cd316174505d26b572'
            'f10ea477cb14d9ef985de2707be3f60006205d19114572614b6c71feb237c03d')

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"

        install -Dm 0644 udev/69-mooltipass.rules "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
}
