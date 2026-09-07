# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-compose
pkgver=0.12.1
pkgrel=1
pkgdesc="Docker Compose management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-compose"
license=('MIT')
depends=('cockpit')
optdepends=('docker: container runtime with Compose plugin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('985b650e11a69915a00bd18eb6a1ee27d4124fbc06b5136ffd149aab2b770ce0')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
    cp -r "${pkgname}/assets"                  "${pkgdir}/usr/share/cockpit/${pkgname}/"
}
