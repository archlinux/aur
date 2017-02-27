# Maintainer: Gus deMayo <gus.demayo@gmail.com>

pkgname="desktop-dimmer"
fullpkgname="Desktop Dimmer"
pkgver=2.5.1
pkgrel=1
pkgdesc="Enables darker-than-dark Desktop dimming for your displays."
arch=("x86_64")
url="https://github.com/sidneys/${pkgname}"
license=("MIT")
source=("https://github.com/sidneys/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
md5sums=("879530725ACF33D20F4212635B0C1063")
replace_str="\/opt\/${fullpkgname}\/${pkgname}"

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/opt/"
    install -dm644 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/opt/${fullpkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/${replace_str}/${pkgname}/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
