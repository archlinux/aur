# Maintainer: alswl <alswlx@gmail.com>

pkgname=foxone
pkgver=1.8.2
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
    "https://www.fox.one/build/Fox-${pkgver}.bin"
    "foxone.sh"
    "appimagekit-foxone-desktop.png"
    "${_desktop}"
)
noextract=("Fox-${pkgver}.bin")
sha256sums=(
    "b89de68bcdf02b90518b369b8b0a9ecbb41c8c5111239352565511bd7d208310"
    "dec3e707f36cc4c27916f9eb92ca5c46a5690ab0887256190ed3faa07391fac1"
    "5c3f8bb3ace24a55bd92ea57a6cad93d2ade8e5dd5a363d6a9b114de62c28e07"
    "f77f7b773fa3274cb779b0daf9da239dcb0eb821e2963bf7a9d0231bbf494a38"
)

package() {
    install -D -m755 "${srcdir}/Fox-${pkgver}.bin" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -D -m755 "${srcdir}/foxone.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -D -m644 appimagekit-foxone-desktop.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/appimagekit-foxone-desktop.png"
}
