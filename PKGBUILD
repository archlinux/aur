# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mooltipass-udev
pkgver=2017021102
pkgrel=2
pkgdesc="Udev rules to connect Mooltipass devices"
arch=('any')
url="https://github.com/bobsaintcool/${pkgname}"
license=('GPL3')

depends=('libusb'
         'udev')

# https://web.bourgeois.eu/static/pgp/3486CBAC7F116CA71351B0D7F7181B2010660E6F.asc
validpgpkeys=('3486CBAC7F116CA71351B0D7F7181B2010660E6F')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('428c8284fd9bd52a0e0b38de2b3262158090038051b16210e9ebba2bc0859f8a'
            'a0dbf810bf64b24a29073764c64bedb39372492bd4720f23524e4fe6cdffea72')

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"

        install -Dm 644 udev/69-mooltipass.rules "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
}
