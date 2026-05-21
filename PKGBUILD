# Maintainer: Neal Peng <vimlinux@proton.me>
pkgname=markra
_pkgname=Markra
pkgver=0.4.0
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor with native AI."
arch=('x86_64')
url="https://github.com/murongg/markra"
license=('AGPL-3.0')
conflicts=('markra-bin')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.rpm")

sha256sums=('a9b39037efe9208bafb1181e9a6b4857a38613a5d222a7ae4b59296c6efe77fd')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" "${srcdir}/usr/bin/markra"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
