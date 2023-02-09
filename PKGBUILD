# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
pkgver=0.0.8
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4' 'gobject-introspection')

source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-arm64-v${pkgver}-.tar.zst")
sha256sums_x86_64=('4bb5acfa81842c451dbeec45b20516f2a592e2324f7f32caa89e3a8b876fa8aa')
sha256sums_aarch64=('60198272cfbfba9ba896cffac368949d1924ac5cfac3ada23691d47657eabe77')

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/xyz.diamondb.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/xyz.diamondb.${_pkgname}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/xyz.diamondb.${_pkgname}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
