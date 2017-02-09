# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mooltipass-udev
pkgver=2017020702
pkgrel=1
pkgdesc="Udev rules to connect Mooltipass devices"
arch=('any')
url="https://git.bourgeois.eu/"
license=('GPL3')

depends=('libusb'
         'udev')

# https://web.bourgeois.eu/static/pgp/3486CBAC7F116CA71351B0D7F7181B2010660E6F.asc
validpgpkeys=('3486CBAC7F116CA71351B0D7F7181B2010660E6F')

source=("${pkgname}-${pkgver}.tar.gz::${url}/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('75d952478510e9c91ae5977cba791186ec9423f74b15af6740c11ce595990530'
            'SKIP')

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"

        install -Dm 644 udev/69-mooltipass.rules "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
}
