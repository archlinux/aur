# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="zui-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_githuburl="https://github.com/brimdata/zui"
license=(custom)
providers=()
conflicts=("${pkgname%-bin}")
depends=('libxcomposite' 'pango' 'libxkbcommon' 'nss' 'nspr' 'sqlite' 'alsa-lib' 'glibc' 'libxrandr' 'libxcb' 'libxext' 'libxfixes' 'gcc-libs' \
    'hicolor-icon-theme' 'libcups' 'glib2' 'expat' 'libx11' 'libxdamage' 'python' 'zlib' 'libdrm' 'gtk3' 'mesa' 'dbus' 'sh' 'at-spi2-core' 'cairo')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/brimdata/zui/main/LICENSE.txt")
sha256sums=('58b465721cda4530e9f2a3953d2fa29b3be3e73a6e3c2faf4d09e31c7991158b'
            '33ce5f6786afd6ab52da7ba3ebe425d67bd3dc892a527ae6ce8e5705479f7dd7')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}