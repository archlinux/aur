# Maintainer: Gus deMayo <gus.demayo@gmail.com>

pkgname="desktop-dimmer"
fullpkgname="Desktop Dimmer"
pkgver=2.2.0
pkgrel=1
pkgdesc="Enables darker-than-dark Desktop dimming for your displays."
arch=("x86_64")
url="https://github.com/sidneys/${pkgname}"
license=("MIT")
source=("https://github.com/sidneys/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
md5sums=("CA4C916E7D1C37A1711EE697494A6C30")

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/opt/${fullpkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/icons/"
    mkdir "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/${fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/\/opt\/${fullpkgname}\/${pkgname}/${pkgname}/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
