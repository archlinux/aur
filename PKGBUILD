# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent-bin
_pkgname=dissent
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.21
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

sha256sums_x86_64=('237089b61e4db1ee7acab2bbc5e145831febb15a503fb682edd62712c37c1bc2')
sha256sums_aarch64=('23a786ab383a491dd158eabdf245b2fe5d53ad8ce17498007e80e7abdaf3585b')
source_x86_64=("https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64-v${pkgver}-.tar.zst")
source_aarch64=("https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64-v${pkgver}-.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    mkdir -p "${srcdir}/share/icons/hicolor/scalable/apps/"
    mv "${srcdir}/share/icons/hicolor/256x256/apps/dissent.svg" "${srcdir}/share/icons/hicolor/scalable/apps/so.libdb.dissent.svg"
    rm -rf "${srcdir}/share/icons/hicolor/256x256/"
    cp -r "${srcdir}/share/" "${pkgdir}/usr/"
}
