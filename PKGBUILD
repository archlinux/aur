# Maintainer: Manas Kenge <Manas-Kenge@users.noreply.github.com>
pkgname=daylog-bin
_pkgname=daylog
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal screen-time tracker for Linux"
arch=('x86_64')
url="https://github.com/Manas-Kenge/Daylog"
license=('MIT')
provides=('daylog')
conflicts=('daylog')
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/daylog-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
    "README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
)
sha256sums=(
    '762dfb55a03c6d802397a57a2e2765a07ed255ea8a4b511ddc747ad8a50e3e42'
    'SKIP'
    'SKIP'
)
options=('!strip')

package() {
    install -Dm755 "${srcdir}/daylog" "${pkgdir}/usr/bin/daylog"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
