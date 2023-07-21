# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="streamdock-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="Streaming service viewer."
arch=('x86_64')
url="https://github.com/jtvberg/StreamDock"
license=("MIT")
depends=('hicolor-icon-theme' 'pango' 'expat' 'libxkbcommon' 'libxrandr' 'alsa-lib' 'libxdamage' 'libxext' 'libdrm' 'gcc-libs' \
    'cairo' 'libx11' 'libxcomposite' 'glib2' 'glibc' 'libxfixes' 'nspr' 'libcups' 'gtk3' 'dbus' 'nss' 'libxcb' 'mesa' 'at-spi2-core')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/StreamDock_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/jtvberg/StreamDock/main/LICENSE")
sha256sums=('03210301d88b67e28ac8788484da5918b86e62bf170348911af342a67223dae4'
            'b6e6ffdf656d1070c5cbaa10491eb4ae4977c8312c7da38d2ed5f118006ce776')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}