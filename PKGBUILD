# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-caddy
pkgver=1.0.0
pkgrel=1
pkgdesc="Caddy reverse proxy management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-caddy"
license=('AGPL-3.0-only' 'MIT' '0BSD' 'OFL-1.1')
depends=('cockpit')
optdepends=('caddy: the reverse proxy server this plugin manages')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a17a65bbae3885dcb4b02e4d27e8c279f8fadbe0815faa9865beee67f80a2b32')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
    cp -r "${pkgname}/assets" "${pkgdir}/usr/share/cockpit/${pkgname}/"

    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}/THIRD-PARTY-NOTICES.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.txt"
}
