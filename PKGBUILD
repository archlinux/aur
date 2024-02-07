# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.18
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

sha256sums_x86_64=('345cec465f7b3d3d46c67944e161cde13f52b8dc393000906fcd78a84a568151')
sha256sums_aarch64=('c56e152776b4402dc9ecf63bf3ce837544acd7948b749e0c04723b31a6b2b1d3')
source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.svg"
    install -Dm 644 "${srcdir}/share/dbus-1/services/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}
