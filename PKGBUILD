# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=key-echo-bin
_pkgname=KeyEcho
pkgver=0.0.5
pkgrel=2
pkgdesc="Listen to Mechanical Keyboard Sounds with Every Keystroke - It's Fast.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/ZacharyL2/KeyEcho"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'alsa-lib'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.armhfp.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('f982b140942383f3b2883ad199a645881aeeb7975ac2bcb611299d74d3a131e4')
sha256sums_armv7h=('7475ce012575ac9b64774ea0d67eda6eca8839504e356a99752d965ffb7a0ddb')
sha256sums_x86_64=('daca03e49bb6a67537452dac3b81aa9f143ff31399735c93b310986ac8bfaee4')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}