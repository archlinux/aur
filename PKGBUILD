# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nft-viewer-bin
_appname=nft_viewer
pkgver=1.8.0
pkgrel=1
pkgdesc="An NFT viewer for the Bitshares blockchain network"
arch=('x86_64')
url="https://github.com/BTS-CM/NFT_Viewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'libxrandr' 'libxcomposite' 'glib2' 'expat' 'dbus' 'hicolor-icon-theme' 'libxkbcommon' 'mesa' 'gcc-libs' 'at-spi2-core' \
    'libx11' 'gtk3' 'libxcb' 'glibc' 'libcups' 'pango' 'nspr' 'nss' 'libxdamage' 'libdrm' 'libxfixes' 'libxext' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}.deb"
    "LICENSE::https://raw.githubusercontent.com/BTS-CM/NFT_Viewer/main/LICENSE")
sha256sums=('4918e2e3346ac189cbef6c9fc0f9c6ac61846f301c2c0f86ecc2f3306758ea13'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}