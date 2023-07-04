# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="flawless-cut-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast and lossless video cutter and merger based on Electron."
arch=('x86_64')
url="https://github.com/metadream/app-flawless-cut"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libx11' 'pango' 'libcups' 'expat' 'gcc-libs' 'libxrandr' 'libxfixes' 'libxcomposite' 'nspr' 'dbus' 'nss' 'libxdamage' 'libxext' \
    'glib2' 'hicolor-icon-theme' 'mesa' 'libdrm' 'alsa-lib' 'at-spi2-core' 'libxcb' 'libxkbcommon' 'gtk3' 'cairo' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/metadream/app-flawless-cut/main/LICENSE")
sha256sums=('a1c96b8a2f6b06ffaac913ddb387cfe1b7795d6cb3546b0e48f7560811b9cc37'
            'f3eac6adfa3dd9332b033a4aa8f565d05947b371fa729ceb6712a0123c5dcc46')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}