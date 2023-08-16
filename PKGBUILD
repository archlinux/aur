# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nft-tool-bin
_appname=nft_tool
pkgver=1.7.2
pkgrel=2
pkgdesc="A tool for creating and editing NFTs on the Bitshares blockchain"
arch=('x86_64')
url="https://github.com/BTS-CM/Bitshares_NFT_Issuance_Tool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'libxdamage' 'libxrandr' 'nss' 'gcc-libs' 'alsa-lib' 'glib2' 'libxcomposite' 'libxfixes' 'glibc' 'gtk3' \
    'at-spi2-core' 'cairo' 'libxcb' 'expat' 'libxext' 'libx11' 'nspr' 'libxkbcommon' 'libcups' 'libdrm' 'mesa' 'dbus' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}.deb"
    "LICENSE::https://raw.githubusercontent.com/BTS-CM/Bitshares_NFT_Issuance_Tool/main/License.md")
sha256sums=('87323c333009c7c19b9e904342f180ec9cc66f1d26ac6776fff5806a6193af68'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}