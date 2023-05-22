# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="japreader-bin"
pkgver=1.8.2
pkgrel=2
pkgdesc="An Electron app that helps you read Japanese text."
arch=('x86_64')
url="https://github.com/marisukukise/japReader"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glibc' 'libcups' 'mesa' 'dbus' 'libxfixes' 'libx11' 'pango' 'cairo' 'libdrm' 'libxkbcommon' 'nodejs' \
    'nspr' 'libxext' 'at-spi2-core' 'glib2' 'alsa-lib' 'gtk3' 'libxrandr' 'expat' 'libxdamage' 'libxcb' 'gcc-libs' \
    'libxcomposite' 'nss')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('09e3b7a7a374139371925d777951fe6c756f97fded82568c35f3c9a8381ee756')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/lib/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}