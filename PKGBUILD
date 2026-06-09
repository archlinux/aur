# Maintainer: slatkin@gmail.com
pkgname=mby
pkgver=0.3.3
pkgrel=1
pkgdesc="Terminal client for Emby media server"
arch=('x86_64')
url="https://github.com/slatkin/mby"
license=('MIT')
depends=('mpv' 'openssl')
source=("${pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/slatkin/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('b1b228be7eb2b522ef1214378d944921ddfa7bded0226993c72927561ddf54e2')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "mby.lua" "${pkgdir}/usr/share/${pkgname}/scripts/mby.lua"
    install -Dm644 "Material-Design-Iconic-Font.ttf" \
        "${pkgdir}/usr/share/${pkgname}/fonts/Material-Design-Iconic-Font.ttf"
    install -Dm644 "config.toml" "${pkgdir}/usr/share/${pkgname}/config.toml"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
