# Maintainer: Prem <prmsrswt at gmail dot com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname="auryo"
_desktopname="auryo"
_fullpkgname="Auryo"
pkgver=2.1.2
pkgrel=1
pkgdesc="A SoundCloud client for your desktop."
arch=("x86_64")
url="http://auryo.com"
license=("GPL3")
source=("https://github.com/Superjo149/auryo/releases/download/v${pkgver}/${_fullpkgname}-${pkgver}.pacman")
md5sums=('3382424c498f798802bea7a3bf99dc5e')
_replace_str="\/opt\/${_fullpkgname}\/${_fullpkgname}"

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/opt/${_fullpkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share/applications/${_desktopname}.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/${_replace_str}/${pkgname}/g" "${pkgdir}/usr/share/applications/${_desktopname}.desktop"
}
