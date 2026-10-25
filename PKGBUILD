# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-compose
pkgver=1.0.1
pkgrel=1
pkgdesc="Docker Compose management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-compose"
license=('AGPL-3.0-only' 'MIT' 'BSD-3-Clause' '0BSD' 'OFL-1.1')
depends=('cockpit')
optdepends=('docker: container runtime with Compose plugin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9a25389010e792184f5cfbce9f8584c6209c6951f6dd270802d930e776529249')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
    cp -r "${pkgname}/assets"                  "${pkgdir}/usr/share/cockpit/${pkgname}/"

    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}/THIRD-PARTY-NOTICES.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.txt"
}
