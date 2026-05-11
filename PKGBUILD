# Maintainer: Nithin <nithin3dev@gmail.com>

pkgname=ozhium-ollium
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
    make CC=gcc
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/ozhium-ollium" "${pkgdir}/usr/bin/ozhium-ollium"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/ozhium-ollium-ui" "${pkgdir}/usr/bin/ozhium-ollium-ui"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packaging/aur/share/ozhium-ollium/ozhium-ollium.conf" "${pkgdir}/usr/share/ozhium-ollium/ozhium-ollium.conf"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packaging/aur/share/ozhium-ollium/style.css" "${pkgdir}/usr/share/ozhium-ollium/style.css"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    mkdir -p /var/lib/ozhium-ollium
    mkdir -p /var/log/ozhium-ollium
}
