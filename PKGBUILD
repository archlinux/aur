# Maintainer: alswl <alswlx@gmail.com>

pkgname=foxone
pkgver=1.6.1
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
    "10e5c416e7c3489c511496248cad36518612da3fbbc7f78a4471a497daf0de27"
    "dec3e707f36cc4c27916f9eb92ca5c46a5690ab0887256190ed3faa07391fac1"
    "5c3f8bb3ace24a55bd92ea57a6cad93d2ade8e5dd5a363d6a9b114de62c28e07"
    "f58ce4d407d296b6c521307e29ab9bdd86ba2099e4280eff2fe356d2ecb70466"
)

package() {
    install -D -m755 "${srcdir}/foxone-desktop-${pkgver}-x86_64.bin" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -D -m755 "${srcdir}/foxone.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -D -m644 appimagekit-foxone-desktop.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/appimagekit-foxone-desktop.png"
}
