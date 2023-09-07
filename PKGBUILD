# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soundsync-bin
pkgver=0.4.16
pkgrel=5
pkgdesc="Virtual cables between any audio source and any speaker in your home"
arch=('x86_64')
url="https://soundsync.app/"
_githuburl="https://github.com/geekuillaume/soundsync"
license=('custom:BSL1.1')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('python' 'nss' 'libpulse' 'at-spi2-core' 'gtk3' 'libxfixes' 'libxext' 'libxrandr' 'glib2' 'nspr' \
    'alsa-lib' 'sh' 'dbus' 'gcc-libs' 'mesa' 'libxkbcommon' 'expat' 'libx11' 'glibc' 'libcups' 'libxdamage' \
    'cairo' 'libxcomposite' 'libxcb' 'hicolor-icon-theme' 'libdrm' 'libxshmfence' 'gdk-pixbuf2' 'pango')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-x64-${pkgver}.pacman"
        "https://raw.githubusercontent.com/geekuillaume/soundsync/v${pkgver}/LICENSE")
sha256sums=('12bd6190537d80a29fa89fa2fa37da310593d5e6c54a7fe9f16c5f1509d4b94c'
            '0c659fd7972a1a233b161380cfb177149d6d75b3c4f97c8cf8bbd8eb91b026d0')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}