# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname="auryo"
desktopname="auryo"
fullpkgname="Auryo"
pkgver=1.4.3
pkgrel=1
pkgdesc="A SoundCloud client for your desktop."
arch=("x86_64")
url="http://auryo.com"
license=("")
source=("https://github.com/Superjo149/auryo/releases/download/v${pkgver}/${fullpkgname}-${pkgver}.pacman")
md5sums=("05f226c49d9c6f99ae5b00dedc388de2")
replace_str="\/opt\/${fullpkgname}\/${fullpkgname}"

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/opt/${fullpkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share/applications/${desktopname}.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/${replace_str}/${pkgname}/g" "${pkgdir}/usr/share/applications/${desktopname}.desktop"
}
