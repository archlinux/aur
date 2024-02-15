# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.19
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL-3.0-only')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2'
    'libgirepository' 'harfbuzz' 'glib2' 'graphene' 'cairo'
    'hicolor-icon-theme' 'pango' 'glibc' 'gdk-pixbuf2' 'gcc-libs')

sha256sums_x86_64=('25d32c5d475074cc4868832dc12f1ff8cdc7acc5ffd372959cc1bda83085edc3')
sha256sums_aarch64=('a3665075b8967a47d6096c18d220d47e3403dca9901ee97181f3fd840604f715')
source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.svg"
    install -Dm 644 "${srcdir}/share/dbus-1/services/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}
