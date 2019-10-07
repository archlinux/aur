# Maintainer: tercean <cg@zknt.org>
pkgname=kubeman-appimage
pkgver=0.5.0
pkgrel=1
pkgdesc='The Hero that Kubernetes deserves (kubernetes management GUI)'
arch=('x86_64')
url='https://github.com/walmartlabs/kubeman'
license=('Apache')
provides=('kubeman')
conflicts=('kubeman')
depends=('fuse')
options=(!strip)
_appimage="kubeman.${pkgver}.appimage"
source=(
    "kubeman.${pkgver}.appimage::https://github.com/walmartlabs/kubeman/releases/download/${pkgver}/kubeman.${pkgver}.appimage"
    "kubeman.desktop"
    "kubeman.png"
    )
noextract=("${_appimage}")
sha256sums=(
    '1f64e92422e85fe57b396c955c5e2ce845635809ece8d15f663af778e9113134'
    'SKIP'
    'SKIP'
    )

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/kubeman
    chmod +x "${pkgdir}/usr/bin/kubeman"

    install -Dm644 "kubeman.desktop"                    "${pkgdir}/usr/share/applications/kubeman.desktop"
    install -Dm644 "kubeman.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/kubeman.png" 
}
