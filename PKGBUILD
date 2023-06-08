# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
pkgver=0.0.11
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4' 'gobject-introspection' 'libadwaita')

source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}-1/gtkcord4-linux-amd64-v${pkgver}-1-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}-1/gtkcord4-linux-arm64-v${pkgver}-1-.tar.zst")
sha256sums_x86_64=('25d0224c2f7012578259b7ef26e0c69872df8db6fffb85cd9d5f1a276435fda5')
sha256sums_aarch64=('90aaae6eb31b5c71deb78ec8988a847947248278b1742ac689325fcb5ba14670')

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/xyz.diamondb.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/xyz.diamondb.${_pkgname}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/xyz.diamondb.${_pkgname}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
