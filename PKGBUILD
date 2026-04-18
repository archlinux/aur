# Denys Vusovych <deniskav2006@gmail.com>

pkgname=drg_mod_integration-notag-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Deep Rock Galactic mod loader and integration (Strappazzon fork)"
arch=("x86_64")
url="https://github.com/Strappazzon/drg-mint-notag"
license=('MIT')
provides=("drg_mod_integration")
conflicts=("drg_mod_integration-bin" "drg_mod_integration-git")
depends=('openssl')
options=('!strip')
source=(
    "${url}/releases/download/v${pkgver}/mint-x86_64-unknown-linux-gnu.zip"
    "drg_mod_integration.desktop"
    "icon.png"
)
sha256sums=(
    '906402e045e509f56ea88161345c0a9697c0a2f56eafcd6050dc6c9fe4658606'
    '4d072cc8e36cbdcc8fcbc676b3b9881edccf2da3fc011a1acadaf58908219f5f'
    'babf72fd087d81c285f830416fe4c38783380510383d6ecce20829532af6c9b7'
)
package() {
    install -Dm755 "$srcdir/mint" "${pkgdir}/usr/bin/drg_mod_integration"
    install -Dm644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/drg_mod_integration.desktop" "${pkgdir}/usr/share/applications/drg_mod_integration.desktop"
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/icons/drg_mod_integration.png"
}
