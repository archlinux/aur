# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent-bin
_pkgname=dissent
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.22
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

sha256sums_x86_64=('393666df1f4a31c9fa5971b7aef886dc503adc36a3ee6b9b81a055dbc86252f3')
sha256sums_aarch64=('467504f1e65dbd0ca369f4b5804de98624f05b61de8816affca840b3f3817c52')
source_x86_64=("https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    mkdir -p "${srcdir}/share/icons/hicolor/scalable/apps/"
    cp -r "${srcdir}/share/" "${pkgdir}/usr/"
}
