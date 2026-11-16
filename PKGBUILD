# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=slint-viewer-bin
pkgver=1.19.0
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
sha256sums=('1ca32aeb95667d2ab22fd6e1e25e70793c0c0d9f16ba900cf6cb6619f9bc20db')

package() {
    install -Dm755 "${srcdir}/slint-viewer/slint-viewer" "${pkgdir}/usr/bin/slint-viewer"
    install -Dm644 "${srcdir}/slint-viewer/licenses/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
