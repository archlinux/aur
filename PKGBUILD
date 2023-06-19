# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fotograph-bin
_pkgver=alpha
pkgver="0.1.0${_pkgver}"
pkgrel=1
pkgdesc="A cross platform image manipulation desktop application"
arch=("x86_64")
url="https://fotograph.vercel.app/"
_githuburl="https://github.com/Adedoyin-Emmanuel/FotoGraph"
license=('MIT')
depends=('libdrm' 'expat' 'libx11' 'hicolor-icon-theme' 'libxfixes' 'alsa-lib' 'dbus' 'glib2' 'mesa' 'gcc-libs' 'gtk3' 'nspr' 'cairo' \
    'at-spi2-core' 'libcups' 'libxkbcommon' 'pango' 'libxdamage' 'libxcb' 'glibc' 'libxext' 'nss' 'libxcomposite' 'libxrandr')
conflicts=("${pkgname%-bin}-appimage")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver%${_pkgver}}-${_pkgver}/Fotograph_1.0.0_amd64.deb")
sha256sums=('6c92bb3b3e160abf34bbd8a73e844792a679558ec37ab38a6dad9919e211278f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Fotograph/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}