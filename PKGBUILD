# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="airdrop-tool-bin"
_appname=airdrop_tool
pkgver=0.1.9
pkgrel=1
pkgdesc="Fetch & analyse blockchain tickets. View leaderboards and user tickets. Calculate and perform provably fair airdrops."
arch=('x86_64')
url="https://github.com/BTS-CM/airdrop_tool"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libx11' 'nss' 'dbus' 'expat' 'cairo' 'alsa-lib' 'libxcb' 'libxext' 'mesa' 'libxfixes' 'libxkbcommon' 'at-spi2-core' \
    'hicolor-icon-theme' 'libdrm' 'gcc-libs' 'glibc' 'libxcomposite' 'libcups' 'glib2' 'nspr' 'libxrandr' 'libxdamage' 'pango' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}.deb"
    "LICENSE.md::https://raw.githubusercontent.com/BTS-CM/airdrop_tool/main/License.md")
sha256sums=('2a6c1ef6cb33fd1af4e714d4c3de820b305606cbf67348c7e67df40e5ea7bea0'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}