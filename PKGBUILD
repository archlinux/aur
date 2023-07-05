# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.16.4
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxcb' 'pango' 'glib2' 'libxdamage' 'glibc' 'at-spi2-core' 'java-runtime' 'libx11' 'nspr' 'libdrm' 'nodejs' 'libsecret' \
    'sh' 'libxext' 'expat' 'libcups' 'nss' 'dbus' 'libxfixes' 'mesa' 'gtk3' 'libxcomposite' 'alsa-lib' 'libxkbcommon' 'cairo' 'gcc-libs' 'libxrandr' 'zlib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/lvce-editor/lvce-editor/main/LICENSE")
sha256sums=('7b5b35f28e55989a9ea45bdc6dcbe861f2a3c8c903cc89bdc7c208f4c322c4b5'
            '7736b1dbda2b18af09232f9eb619e4d3d79d855058cc7494853f25d1553ed00b')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}