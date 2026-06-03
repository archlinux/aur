# Maintainer: Neal Peng <vimlinux@proton.me>
pkgname=markra
_pkgname=Markra
pkgver=0.6.7
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor with native AI."
arch=('x86_64')
url="https://github.com/murongg/markra"
license=('AGPL-3.0')
conflicts=('markra-bin')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.rpm")

sha256sums=('4794ca98a141e331dca9f57c7dbb9b7e3553e7f72d2f9763afa2c20f846b5eb1')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" "${srcdir}/usr/bin/markra"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
