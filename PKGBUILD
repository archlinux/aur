# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wewechat++-bin"
pkgver=1.2.5.20230523
_pkgver=1.2.5-20230523
pkgrel=1
pkgdesc="Make weweChat great again!!! 美丽的第三方微信PC客户端"
arch=('aarch64' 'x86_64')
url="https://gitee.com/spark-community-works-collections/wewechat-plus-plus"
license=('MIT')
providers=("${pkgname%++-bin}")
conflits=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'glibc' 'gtk3' 'libx11' 'at-spi2-core' 'expat' 'libxrandr' 'libxcursor' 'libxdamage' 'nss' 'glib2' 'libcups' \
    'libxrender' 'libxext' 'pango' 'cairo' 'nspr' 'alsa-lib' 'libxtst' 'dbus' 'libxfixes' 'libxi' 'libxss' 'libxcomposite' 'libxcb' \
    'gdk-pixbuf2' 'fontconfig' 'gcc-libs')
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.deb::${url}/releases/download/${_pkgver}/${pkgname%++-bin}-1.2.5-linux-arm64.deb")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.deb::${url}/releases/download/${_pkgver}/${pkgname%++-bin}-1.2.5-linux-amd64.deb")
source=("LICENSE::https://gitee.com/spark-community-works-collections/wewechat-plus-plus/raw/master/LICENSE")
sha256sums=('b64d5463454e756d3008ff1a0511179b777884a0b4ed50dfe33e9182cf0c54db')
sha256sums_aarch64=('5ac045251db9af48a7a2d898cfefd0198de23c69e4bd91b7162344bf574051f8')
sha256sums_x86_64=('48f0ede636da8f3a7b4d94a75a8324a51413dbf7ad040cf0acc173cd200088cb')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}