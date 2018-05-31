# Maintainer: alswl <alswlx@gmail.com>

pkgname=foxone
pkgver=1.6.5
pkgrel=1
pkgdesc="Fox.One is a trading app for cryptocurrency users, fusing together every crypto exchange in the world, help them trade smarter, faster, and with more profits and opportunities."
arch=("x86_64")
url="https://www.fox.one/"
license=("custom")
depends=()
optdepends=()
conflicts=()
options=(!strip)
_desktop="appimagekit-foxone-desktop.desktop"
source=(
    "https://www.fox.one/build/foxone-desktop-${pkgver}-x86_64.bin"
    "foxone.sh"
    "appimagekit-foxone-desktop.png"
    "${_desktop}"
)
noextract=("foxone-desktop-${pkgver}-x86_64.bin")
sha256sums=(
    "4100c2b0c97f0f231dc5b9711e6abad67f8cc1aa8e73a5f1de5dcbbc4e6578ad"
    "dec3e707f36cc4c27916f9eb92ca5c46a5690ab0887256190ed3faa07391fac1"
    "5c3f8bb3ace24a55bd92ea57a6cad93d2ade8e5dd5a363d6a9b114de62c28e07"
    "713aaf87e1b2148cdb0f08d7ac66bef48552bfa9f0030a1c614e06cc12d20739"
)

package() {
    install -D -m755 "${srcdir}/foxone-desktop-${pkgver}-x86_64.bin" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -D -m755 "${srcdir}/foxone.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -D -m644 appimagekit-foxone-desktop.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/appimagekit-foxone-desktop.png"
}
