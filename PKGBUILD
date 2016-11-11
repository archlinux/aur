# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=fontbuilder
pkgver=0.6a.r1.fe0d7cf
_commit=fe0d7cf759af86288ea2c59a9d33518535546245
pkgrel=1
pkgdesc="Utility for create texture atlases with bitmap chars from FreeType,TrueType and some other font formats."
arch=('x86_64' 'i686')
url="https://github.com/andryblack/fontbuilder"
license=('MIT')
depends=('qt5-base')
source=('LICENSE'
        "${pkgname}-${pkgver}.tar.gz::https://github.com/andryblack/${pkgname}/archive/${_commit}.tar.gz")
sha512sums=('92725921a2706d66431ab3e357e4b49aa2c713a783885ac06a0a4000bb0e38b063a8dd5b04531a7f59d7e98e90e446ab1240d3f4690cfe4824e26bf25bac7431'
            '122a08f9544b8cfb46520ed197c8ed780919095779251282cd6f88e2816ccdbcfe728b1edee4b3a762fe710f891e9a700bd0a074952c12301f30ad75f084dd1d')

build() {
    cd "${pkgname}-${_commit}"
    qmake
    make
}

package() {
    install -Dm755 "${pkgname}-${_commit}/bin/FontBuilder" "${pkgdir}/usr/bin/fontbuilder"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
