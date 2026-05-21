# Maintainer: Manas Kenge <Manas-Kenge@users.noreply.github.com>
pkgname=daylog-bin
_pkgname=daylog
pkgver=0.2.1
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
    '2d135a9a85e47dd3d7a78f11ad1ccbdc92652b61af64b4a929f7b58efc7c2b9e'
    'SKIP'
    'SKIP'
)
options=('!strip')

package() {
    install -Dm755 "${srcdir}/daylog" "${pkgdir}/usr/bin/daylog"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
