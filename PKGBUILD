# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scenario-rs-gui-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A powerful automation tool for executing remote commands and transferring files via SSH.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/st4s1k/scenario-rs"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('012b6b7875f9ede895c36c18bfd54014e49550629edf6d20e8af61ab41beac45')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
