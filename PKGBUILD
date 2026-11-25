# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Hy4 flash Free.

pkgname=slint-viewer-bin
pkgver=1.19.1
pkgrel=2
pkgdesc="Viewer for Slint UI files (prebuilt binary)"
arch=('x86_64')
url="https://slint-ui.com"
license=('GPL-3.0-only' 'MIT')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'systemd-libs' 'freetype2'
         'libinput' 'mesa' 'fontconfig')
provides=('slint-viewer')
conflicts=('slint-viewer')
options=('!debug' '!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slint-ui/slint/releases/download/v${pkgver}/slint-viewer-linux.tar.gz")
sha256sums=('ae41f8e0b61c7f746d78f7240de9dd110bc9e86606cf43dcebfebd6e6ed8af1e')

package() {
    install -Dm755 "${srcdir}/slint-viewer/slint-viewer" "${pkgdir}/usr/bin/slint-viewer"
    install -Dm644 "${srcdir}/slint-viewer/licenses/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
