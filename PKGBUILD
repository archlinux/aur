# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-compose
pkgver=0.13.0
pkgrel=1
pkgdesc="Docker Compose management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-compose"
license=('AGPL-3.0-only' 'MIT' 'BSD-3-Clause' '0BSD' 'OFL-1.1')
depends=('cockpit')
optdepends=('docker: container runtime with Compose plugin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ab8edda529a4eaa45f94c7e5167d09ab740d0c4c46dbf51185e219ec55ce77b9')

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
