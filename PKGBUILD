# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.16
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2')

sha256sums_x86_64=('38b82cf4af96667823da335404e052aa6a7cef2d53bab50e00f13b7266013a83')
sha256sums_aarch64=('c41e8049cc7e59d9fb1ca5263c987b9ad45015b2a5675abe46e05712f793035f')
source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.svg"
    install -Dm 644 "${srcdir}/share/dbus-1/services/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}
