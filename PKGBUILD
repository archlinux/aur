# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.15.1
_pkgver=0.0.15-1
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2')

sha256sums_x86_64=('5ccd29b39ba8ffd898b00e32d66c20221c1deb1c363f4dd1eb80052ffef8e243')
sha256sums_aarch64=('12b000ac6ee8101372868ab60efe83bbeca73c1c993001a7b70da19b61a562e1')
source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${_pkgver}/gtkcord4-linux-amd64-v${_pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${_pkgver}/gtkcord4-linux-arm64-v${_pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/share/applications/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm 644 "${srcdir}/share/icons/hicolor/256x256/apps/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.svg"
    install -Dm 644 "${srcdir}/share/dbus-1/services/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}
