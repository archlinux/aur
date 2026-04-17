# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

pkgname=slint-viewer-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="Viewer for Slint UI files (prebuilt binary)"
arch=('x86_64')
url="https://slint-ui.com"
license=('GPL-3.0-only' 'MIT')
depends=('glibc')
provides=('slint-viewer')
conflicts=('slint-viewer')
options=('!debug' '!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slint-ui/slint/releases/download/v${pkgver}/slint-viewer-linux.tar.gz")
sha256sums=('5390298bd5e46f079498ba079a91dcb14415ea35a233ccac141f444e4ae74300')

package() {
    install -Dm755 "${srcdir}/slint-viewer/slint-viewer" "${pkgdir}/usr/bin/slint-viewer"
    install -Dm644 "${srcdir}/slint-viewer/licenses/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
