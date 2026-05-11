# Maintainer: Nithin <nithin3dev@gmail.com>
# SKIP COMMENT CHECK
pkgname=ozhium-ollium
pkgdesc="System monitor daemon with GTK4 overlay UI. Monitors backlight, volume, battery, network, and Bluetooth changes and triggers an OSD overlay."
pkgver=1.0.0
pkgrel=1
arch=(x86_64)
url=https://github.com/Nithin-3/ozhium-ollium
license=(BSD-3-Clause)
depends=(libpulse gtk4 gtk4-layer-shell)
makedepends=(gcc pkgconf)
source=("https://github.com/Nithin-3/ozhium-ollium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(SKIP)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make CC=gcc
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/ozhium-ollium" "${pkgdir}/usr/bin/ozhium-ollium"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/ozhium-ollium-ui" "${pkgdir}/usr/bin/ozhium-ollium-ui"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/example/ozhium-ollium.conf" "${pkgdir}/usr/share/ozhium-ollium/ozhium-ollium.conf"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/example/style.css" "${pkgdir}/usr/share/ozhium-ollium/style.css"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
