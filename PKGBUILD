# Maintainer: unassignedthread <unassignedthread@github.com>
pkgname=fluxpass
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI password manager for pass (passwordstore.org) with type-based entries"
arch=('any')
url="https://github.com/unassignedthread/FluxPass"
license=('MIT')
depends=('java-runtime>=17' 'java-openjfx-bin' 'pass' 'gnupg')
source=(
    "${pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${pkgname}.jar"
    "${pkgname}.sh::${url}/raw/v${pkgver}/${pkgname}.sh"
    "${pkgname}.desktop::${url}/raw/v${pkgver}/${pkgname}.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

    install -Dm755 "${srcdir}/${pkgname}.sh" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
