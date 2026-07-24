# Maintainer: slatkin@woims.net
pkgname=mbv
pkgver=0.14.2
pkgrel=1
pkgdesc="Terminal client for Emby media server"
arch=('x86_64')
url="https://github.com/slatkin/mbv"
license=('MIT')
depends=('mpv' 'openssl')
source=("${pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/slatkin/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('15f7fc854327c3dc66b3e876912282f072a31a460e7832b86b9439ed4ff55da4')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "mbvd" "${pkgdir}/usr/bin/mbvd"
    install -Dm644 "mbv.lua" "${pkgdir}/usr/share/${pkgname}/scripts/mbv.lua"
    install -Dm644 "Material-Design-Iconic-Font.ttf" \
        "${pkgdir}/usr/share/${pkgname}/fonts/Material-Design-Iconic-Font.ttf"
    install -Dm644 "config.toml" "${pkgdir}/usr/share/${pkgname}/config.toml"
    install -Dm644 "mbvd.service" "${pkgdir}/usr/lib/systemd/system/mbvd.service"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
