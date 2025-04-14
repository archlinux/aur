# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=risuai-bin
_pkgname=RisuAI
pkgver=158.2.1
pkgrel=1
pkgdesc="Make your own story. User-friendly software for LLM roleplaying.(Prebuilt version)"
arch=('x86_64')
url="https://risuai.net/"
_ghurl="https://github.com/kwaroran/RisuAI"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('af304dd8a9400fec5d48973c39fd1cee457e12f495f9e7a0e2f47f0f086f5c85')
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
