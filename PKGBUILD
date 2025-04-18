pkgname=drg_mod_integration-notag-bin
pkgver=0.2.13
pkgrel=1
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
    '1279c8cfa18562869d465abbef3bda5e0f0a83330e7f66b1b3958d6430faf52f'
    '1d5630a17ac4c362a398b1a71b16a2a5cff451b4095861f735805ae08f3ac328'
)
package() {
    cd "$srcdir/drg_mod_integration-x86_64-unknown-linux-gnu"
    install -Dm755 drg_mod_integration "${pkgdir}/usr/bin/drg_mod_integration"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/drg_mod_integration.desktop" "${pkgdir}/usr/share/applications/drg_mod_integration.desktop"
}
