# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dicionario.js-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="Simple dictionary in which you record your own words."
arch=('x86_64')
url="https://github.com/ArthurLobopro/dicionario.js"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-ng-bin}")
depends=('nss' 'nodejs' 'nspr' 'gtk3' 'glibc' 'alsa-lib' 'libxcomposite' 'mesa' 'libxrandr' 'cairo' 'libxcb' 'at-spi2-core' \
    'pango' 'libxext' 'gcc-libs' 'libx11' 'libxfixes' 'libxkbcommon' 'glib2' 'libxdamage' 'libdrm' 'dbus' 'libcups' 'expat')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ArthurLobopro/dicionario.js/main/LICENSE")
sha256sums=('d495f71d2019c7e44c8fa16b64d1cb9dfbae04411fc5c86ca4eed491a183351a'
            'c898d2875697b8ed803b6f18c641a194614b29c26c638eb8135398bc80255e26')
   
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 0755 "${pkgdir}/usr/lib/${pkgname%-bin}/chrome-sandbox"
}