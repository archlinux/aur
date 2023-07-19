# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="zui-bin"
pkgver=1.1.0
pkgrel=3
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_githuburl="https://github.com/brimdata/zui"
license=("BSD")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('python' 'alsa-lib' 'gcc-libs' 'libxdamage' 'expat' 'zlib' 'cairo' 'hicolor-icon-theme' 'at-spi2-core' 'libxkbcommon' \
    'nss' 'libx11' 'sqlite' 'libxrandr' 'glibc' 'glib2' 'libxcomposite' 'pango' 'gtk3' 'libcups' 'mesa' 'libxext' 'libxcb' \
    'libdrm' 'bash' 'dbus' 'nspr' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/brimdata/zui/main/LICENSE.txt")
sha256sums=('58b465721cda4530e9f2a3953d2fa29b3be3e73a6e3c2faf4d09e31c7991158b'
            'e3d24db419fcb44a1dab91f351b8203e74e8501ea11c4be82ad3cc05070cad9f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}