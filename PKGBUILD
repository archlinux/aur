# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yarle-evernote-to-md-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Yarle - The ultimate converter of Evernote notes to Markdown"
arch=(x86_64)
url="https://github.com/akosbalasko/yarle"
license=('MIT')
depends=('libxrandr' 'libxkbcommon' 'nss' 'libxdamage' 'glibc' 'hicolor-icon-theme' 'libxcomposite' 'libxext' 'libxfixes' 'libx11' \
    'gtk3' 'libdrm' 'nspr' 'cairo' 'dbus' 'libcups' 'at-spi2-core' 'glib2' 'alsa-lib' 'expat' 'pango' 'gcc-libs' 'libxcb' 'mesa')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/akosbalasko/yarle/master/LICENSE")
sha256sums=('8a8db2599c3c6a7a94ad9a5b3542c27ab386745c147958ebf6018e356a323d28'
            '16691c563f896a0d485a742fbd5a389fc7c798ff606c75cb3f753bb7297a9bdb')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}