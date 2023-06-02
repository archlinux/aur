# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="airdrop-tool-bin"
_appname=airdrop-tool
pkgver=0.1.3
pkgrel=1
pkgdesc="Fetch & analyse blockchain tickets. View leaderboards and user tickets. Calculate and perform provably fair airdrops."
arch=('x86_64')
url="https://github.com/BTS-CM/airdrop_tool"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libx11' 'nss' 'dbus' 'expat' 'cairo' 'alsa-lib' 'libxcb' 'libxext' 'mesa' 'libxfixes' 'libxkbcommon' 'at-spi2-core' \
    'hicolor-icon-theme' 'libdrm' 'gcc-libs' 'glibc' 'libxcomposite' 'libcups' 'glib2' 'nspr' 'libxrandr' 'libxdamage' 'pango' 'gtk3')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/airdrop_tool.deb"
    "LICENSE.md::https://raw.githubusercontent.com/BTS-CM/airdrop_tool/main/License.md")
sha256sums=('98cbb5a1a1066a8df08bee87bd0ae4bff7996cf1779f344253f87e54ed7342eb'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}