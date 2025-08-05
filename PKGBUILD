pkgname=drg_mod_integration-notag-bin
pkgver=0.2.14
pkgrel=2
pkgdesc="Deep Rock Galactic mod loader and integration (Strappazzon fork)"
arch=("x86_64")
url="https://github.com/Strappazzon/drg-mint-notag"
license=('MIT')
provides=("drg_mod_integration")
conflicts=("drg_mod_integration-bin")
depends=('openssl-1.1')
options=('!strip')
source=(
    "${url}/releases/download/v${pkgver}/mint-notag-linux-x86_64.tar.xz"
    "drg_mod_integration.desktop"
    "icon.png"
)
sha256sums=(
    '0b8f12ae9327f96fefa0559a7ae409d4c3956fce4e53c90ce137d0acf8bb8a77'
    '4d072cc8e36cbdcc8fcbc676b3b9881edccf2da3fc011a1acadaf58908219f5f'
    'babf72fd087d81c285f830416fe4c38783380510383d6ecce20829532af6c9b7'
)
package() {
    cd "$srcdir/drg_mod_integration-x86_64-unknown-linux-gnu"
    install -Dm755 drg_mod_integration "${pkgdir}/usr/bin/drg_mod_integration"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/drg_mod_integration.desktop" "${pkgdir}/usr/share/applications/drg_mod_integration.desktop"
    install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/icons/drg_mod_integration.png"
}
