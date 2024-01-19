# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.17
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2')

sha256sums_x86_64=('10f58bd6dc325b61f97d9c48d868c1d5e6c594f11e4ab94da84b77301f705ba3')
sha256sums_aarch64=('05e59dc002535d4d298128af6bdeba05b3e2226c7d9f646d6f99bfc7b26b805c')
source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.svg"
    install -Dm 644 "${srcdir}/share/dbus-1/services/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}
