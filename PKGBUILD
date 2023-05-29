# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="dooble-bin"
pkgver=2023.05.31
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('custom')
depends=('libxshmfence' 'xcb-util-image' 'libxi' 'xcb-util-cursor' 'libxdamage' 'gstreamer' 'freetype2' 'libcups' 'libxcomposite' 'libx11' \
    'qt6-declarative' 'gdk-pixbuf2' 'gcc-libs' 'glibc' 'nspr' 'gtk3' 'at-spi2-core' 'xcb-util-keysyms' 'bash' 'cairo' 'libdrm' \
    'gst-plugins-base-libs' 'libxfixes' 'libglvnd' 'libxcb' 'fontconfig' 'libxkbcommon' 'xcb-util-wm' 'nss' 'alsa-lib' 'dbus' 'qt6-base' \
    'krb5' 'libxkbcommon-x11' 'xcb-util-renderutil' 'glib2' 'libxrandr' 'libxrender' 'wayland' 'libxtst' 'expat' 'libxext' 'zlib' 'libxkbfile' 'pango')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('43c849dbef96a50685fedcdab8179b74bff0035233c13488af094220d50234f2'
            'cbf629abfdc78b888d87ceae0847a9129e5b0e1baa8da4a1cec53324f38defb7')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}