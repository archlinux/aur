# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent-bin
_pkgname=dissent
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.20
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
provides=('dissent')
conflicts=('dissent' 'dissent-git')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2'
    'libgirepository' 'harfbuzz' 'glib2' 'graphene' 'cairo'
    'hicolor-icon-theme' 'pango' 'glibc' 'gdk-pixbuf2' 'gcc-libs')

sha256sums_x86_64=('70fdd326c071ae2d0e05d4afd10181d1d021c6297afbd6d262d563d4f0f46f2e')
sha256sums_aarch64=('8beed2054a973795e7b47387a6fef7981805f68665441aeb9a8242908132de44')
source_x86_64=("https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/share/" "${pkgdir}/usr/"
}
