# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dicionario.js-bin
pkgver=2.3.1
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
sha256sums=('668d8b6f5ac514263fb814755d7c49c0541ace9938517e0950a8cc2d743f9718'
            '08b5d8040de362bf504006f6f6c1699130fa365344de6c325d5c481279e285b4')
   
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 0755 "${pkgdir}/usr/lib/${pkgname%-bin}/chrome-sandbox"
}