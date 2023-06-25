# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rotion-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="An Electron application with React and TypeScript"
arch=('x86_64')
url="https://github.com/Azanniel/rotion-electron-app"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libcups' 'libxdamage' 'libxfixes' 'glibc' 'dbus' 'libx11' 'libxext' 'glib2' 'libxcomposite' 'gcc-libs' 'libxrandr' \
    'expat' 'at-spi2-core' 'cairo' 'libxkbcommon' 'libxcb' 'libdrm' 'nss' 'alsa-lib' 'gtk3' 'nspr' 'pango' 'mesa' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('8bf2e8c081c9ec7c12dd97c55fdc0dd4740e7e9d1e90f52a19d8364c572f239a')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Rotion/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}