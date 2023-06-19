# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nft-viewer-bin"
pkgver=1.7.1
pkgrel=1
pkgdesc="An NFT viewer for the Bitshares blockchain network"
arch=('x86_64')
url="https://github.com/BTS-CM/NFT_Viewer"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('cairo' 'libxrandr' 'libxcomposite' 'glib2' 'expat' 'dbus' 'hicolor-icon-theme' 'libxkbcommon' 'mesa' 'gcc-libs' 'at-spi2-core' \
    'libx11' 'gtk3' 'libxcb' 'glibc' 'libcups' 'pango' 'nspr' 'nss' 'libxdamage' 'libdrm' 'libxfixes' 'libxext' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/nft_viewer.deb"
    "LICENSE::https://raw.githubusercontent.com/BTS-CM/NFT_Viewer/main/LICENSE")
sha256sums=('67b21fc37eec54d18c49148c91796a69b78c8959505af56003d4165e66a1f18b'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}