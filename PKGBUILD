# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nora-bin"
pkgver=2.3.0stable
_appver=2.3.0-stable
pkgrel=1
pkgdesc="An elegant music player built using Electron and React. Inspired by Oto Music for Android by Piyush Mamidwar."
arch=('x86_64')
url="https://github.com/Sandakan/Nora"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('hicolor-icon-theme' 'glibc' 'libcups' 'mesa' 'dbus' 'libxfixes' 'libx11' 'pango' 'cairo' 'libdrm' 'libxkbcommon' \
    'nspr' 'libxext' 'at-spi2-core' 'libvips' 'glib2' 'alsa-lib' 'gtk3' 'libxrandr' 'expat' 'libxdamage' 'libxcb' 'gcc-libs' \
    'libxcomposite' 'nss')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${_appver}/Nora-Setup-${_appver}-linux-amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/Sandakan/Nora/master/LICENSE.txt")
sha256sums=('ec64f6e43ba3926a9517a4771e56c2092f5eb751d4e3ba75d7ba0e2a3fc0b767'
            '7c27f3771d31e4ba1a227b2aec04ff8892512ba80dd0fb9435115a6523e2980e')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}