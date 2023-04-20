# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="redis-viewer-bin"
pkgver=2.2.2
pkgrel=1
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode."
arch=('x86_64')
url="https://github.com/redisviewer/RedisViewer"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
providers=()
depends=('hicolor-icon-theme' 'libdrm' 'gcc-libs' 'glibc' 'at-spi2-core' 'libxdamage' 'gtk3' 'nspr' 'libxfixes' 'libcups' 'libxcb' \
    'libxrandr' 'libxi' 'libxrender' 'libxext' 'dbus' 'libx11' 'libxss' 'pango' 'alsa-lib' 'expat' 'libxcursor' 'libxcomposite' \
    'gdk-pixbuf2' 'libxtst' 'mesa' 'nss' 'cairo' 'glib2')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Redis.Viewer-${pkgver}.deb"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('eeae331ec3119fbfe773986b43a609a732a95d5fe3932fd5f310ea2b663600eb'
            '68f3ca5eaa3a59b7e01cbafc7848cb20ea108627ed0c94023e7536adfeeb3e89')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}