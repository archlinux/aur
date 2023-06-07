# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="popcorn-fx-bin"
pkgver=0.7.2
pkgrel=1
pkgdesc="A multi-platform torrent streaming client that includes an integrated media player with support for embedded devices such as the Raspberry PI."
arch=("x86_64")
url="https://github.com/yoep/popcorn-fx"
license=('GPL3')
depends=('libxtst' 'libx11' 'dbus' 'java-runtime' 'alsa-lib' 'glibc' 'libxrender' 'openssl' 'gcc-libs' 'libxext' 'zlib' 'libxi' 'freetype2')
conflicts=("${pkgname%-bin}" "${pkgname%-fx-bin}time")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-fx-bin}-time_${pkgver}.deb")
sha256sums=('de856ae1be198456e2bdcbd29656d5c7c887e9a68c610382088b5ef5f3832f4f')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    sed "s|/opt/${pkgname%-fx-bin}-time/${pkgname%-fx-bin}-time.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-fx-bin}-time.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-fx-bin}-time/${pkgname%-fx-bin}-time.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}