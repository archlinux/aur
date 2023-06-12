# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nft-tool-bin"
pkgver=1.6.2
pkgrel=1
pkgdesc="A tool for creating and editing NFTs on the Bitshares blockchain"
arch=('x86_64')
url="https://github.com/BTS-CM/Bitshares_NFT_Issuance_Tool"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('hicolor-icon-theme' 'libxdamage' 'libxrandr' 'nss' 'gcc-libs' 'alsa-lib' 'glib2' 'libxcomposite' 'libxfixes' 'glibc' 'gtk3' \
    'at-spi2-core' 'cairo' 'libxcb' 'expat' 'libxext' 'libx11' 'nspr' 'libxkbcommon' 'libcups' 'libdrm' 'mesa' 'dbus' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/nft_tool.deb"
    "LICENSE::https://raw.githubusercontent.com/BTS-CM/Bitshares_NFT_Issuance_Tool/main/License.md")
sha256sums=('3deb93979278a6b2024c41d1be5494b02e1a943c7fafd4761e87043df74d8c8c'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}