# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-libadwaita-bin
_pkgname=gtkcord4
pkgver=0.0.8
pkgrel=1
pkgdesc='Discord client written in go and gtk4, binary release'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4' 'gobject-introspection' 'libadwaita')

source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-amd64-v${pkgver}-libadwaita.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-arm64-v${pkgver}-libadwaita.tar.zst")
sha256sums_x86_64=('d7ab9be01b8f213e504ccde0c53982cc0531a2ff139fbba610461a7ed62d976b')
sha256sums_aarch64=('6607b8c7808ac04955a2ffb0c5ace735f64d77fe69997cde23008000e4610741')

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/xyz.diamondb.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/xyz.diamondb.${_pkgname}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/xyz.diamondb.${_pkgname}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
