# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youtube-smarttv-emu-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A cross platform app built with Electron that opens an instance of the Smart TV version of Youtube."
arch=('x86_64')
url="https://github.com/platevoltage/youtube-smarttv-emu"
license=("MIT")
depends=('expat' 'dbus' 'nss' 'alsa-lib' 'libxfixes' 'glibc' 'libdrm' 'glib2' 'mesa' 'libxrandr' 'libxext' 'wayland' 'at-spi2-core' \
    'libxcb' 'libx11' 'pango' 'gtk3' 'nspr' 'gcc-libs' 'libcups' 'libxcomposite' 'libxkbcommon' 'libxdamage' 'cairo' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/platevoltage/youtube-smarttv-emu/main/LICENCE")
sha256sums=('83ba642af297fccc57f6017f32825b0cb523ed35f257905430b7b7cc14400aeb'
            '2c7bd4372f284a7f952702e50d98d0ef6c5fbb1d1792f9d6d54862cd5fc03860')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}