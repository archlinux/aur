# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quark-player-bin
pkgver=3.1.9
pkgrel=2
pkgdesc="An Electron based Web Video Services Player, supporting Netflix, Youtube, Twitch, Floatplane, Hulu and More!"
arch=('x86_64')
url="https://github.com/Alex313031/quark-player"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'pango' 'expat' 'mesa' 'libdrm' 'libxcb' 'glibc' 'libxfixes' 'dbus' 'nss' 'hicolor-icon-theme' 'libxkbcommon' \
    'cairo' 'libxrandr' 'at-spi2-core' 'glib2' 'libxdamage' 'gcc-libs' 'libx11' 'libxext' 'nspr' 'libcups' 'libxcomposite' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/quark-player/master/LICENSE.md")
sha256sums=('63a31887d4f629de0278ebef13b78f60a25bd4b054ae2c251aed3ffbf1975a2e'
            'f60c2918d56a97a03b92e13e9fc479e81db309476ec26f7c8c0df82007612117')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    1install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}