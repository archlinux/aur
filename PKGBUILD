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
)
sha256sums=(
    '0b8f12ae9327f96fefa0559a7ae409d4c3956fce4e53c90ce137d0acf8bb8a77'
    '4a10c10b4c55ce32aafea630fbfc57e7f06b81ef55fa7bc2e7fbd9945cc2f9b0'
)
package() {
    cd "$srcdir/drg_mod_integration-x86_64-unknown-linux-gnu"
    install -Dm755 drg_mod_integration "${pkgdir}/usr/bin/drg_mod_integration"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/drg_mod_integration.desktop" "${pkgdir}/usr/share/applications/drg_mod_integration.desktop"
}
