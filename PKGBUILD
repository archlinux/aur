# Maintainer: DisLogicator <supasecrethacker@gmail.com>

pkgname='hancomoffice'
pkgver=11.20.0.1520
pkgrel=1
pkgdesc="Hancom office programs provided by Hancom. Ported to Arch Linux from Hancom Gooroom OS."
arch=('x86_64')
url='https://www.hancom.com/'
license=('custom:hancomoffice')
depends=('harfbuzz-icu' 'libcurl-gnutls' 'glu')
source=(
    "https://github.com/DisLogicator/hoffice/releases/download/11.20.0.1520-rc2/hoffice-11.20.0.1520.tar.gz"
    "LICENSE"
)
sha256sums=(
    '4a683809eff85b460efbf2989219adbf2d7e246d414be52f55823a2e3605605d'
    'bd67280ffdf6928abab99f3f7f01ad46b19d85d641bd49286ef6d3e6a258cee3'
)

package() {
    msg2 "Please ignore the errors. They don't mean anything."
    mkdir "${pkgdir}/opt"
    mkdir "${pkgdir}/opt/hnc"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}"/*.desktop
    bsdtar -xf hoffice11.zip -C "${pkgdir}/opt/hnc"
    install -Dm644 -t "${pkgdir}/opt/hnc/icons" "${srcdir}"/*.png

}
