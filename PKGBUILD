# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mooltipass-udev
pkgver=2017021102
pkgrel=1
pkgdesc="Udev rules to connect Mooltipass devices"
arch=('any')
url="https://github.com/bobsaintcool/${pkgname}"
license=('GPL3')

depends=('libusb'
         'udev')

# https://web.bourgeois.eu/static/pgp/3486CBAC7F116CA71351B0D7F7181B2010660E6F.asc
validpgpkeys=('3486CBAC7F116CA71351B0D7F7181B2010660E6F')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('428c8284fd9bd52a0e0b38de2b3262158090038051b16210e9ebba2bc0859f8a')

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"

        install -Dm 644 udev/69-mooltipass.rules "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
}
