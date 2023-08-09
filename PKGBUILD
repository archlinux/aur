# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woocommerce-pos-bin
_appname=wcpos-app-electron
pkgver=1.3.1
pkgrel=1
pkgdesc="Electron Desktop App for WooCommerce POS"
arch=('x86_64')
url="https://github.com/wcpos/electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'at-spi2-core' 'pango' 'mesa' 'libxcomposite' 'glib2' 'alsa-lib' 'nspr' 'gtk3' 'nss' 'libxdamage' \
    'libdrm' 'dbus' 'libxext' 'libxcb' 'libxkbcommon' 'expat' 'libx11' 'libxrandr' 'gcc-libs' 'cairo' 'libxfixes' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('6ad7f37a58ed4c56954d56f9470c18d65f78f4280fe99ea3fe906ef8ce4087b1')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
    chmod 0755 "${pkgdir}/usr/lib/${_appname}/chrome-sandbox"
}