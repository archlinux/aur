# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="kindle-companion-bin"
pkgver=1.0.6
pkgrel=1
pkgdesc="Kindle Companion enables readers to easily access and manage vocabulary lookups and clippings on their Amazon Kindle device"
arch=("x86_64")
url="https://saharzelo.github.io/kindle-companion/"
_githuburl="https://github.com/saharzelo/kindle-companion"
license=('MIT')
depends=('cairo' 'mesa' 'libcups' 'glib2' 'libx11' 'libxext' 'libdrm' 'nspr' 'libxfixes' 'gtk3' 'libxkbcommon' 'glibc' 'at-spi2-core' \
    'nss' 'gcc-libs' 'dbus' 'libxrandr' 'libxcomposite' 'expat' 'hicolor-icon-theme' 'libxcb' 'wayland' 'alsa-lib' 'libxdamage' 'pango')
makedepends=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/Kindle-Companion-${pkgver}.deb"
    "LICENSE.md::https://raw.githubusercontent.com/saharzelo/kindle-companion/main/LICENSE.md")
sha256sums=('564bc5e3eb16f9af6fc7b9727e500e9a0f4fd4ce2d040de3d0faf636df5452a3'
            '613e2910e5cda3ce6e5b878e214d955c2a34e3475e97d365fcbec5e345a06038')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}