# Maintainer: Mattes Rötschke <dev at mattes-roetschke dot de>
pkgname=stuart-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A serial terminal TUI"
arch=('x86_64')
url="https://github.com/mroetsc/stuart"
license=('AGPL-3.0-only')
provides=('stuart')
conflicts=('stuart')

source=(
    "stuart-${pkgver}-x86_64.tar.gz::https://github.com/mroetsc/stuart/releases/download/${pkgver}/stuart-${pkgver}-x86_64-linux.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/mroetsc/stuart/refs/tags/${pkgver}/LICENSE"
)

sha256sums=('f46d1d30e5cee605b9fc221d64520a6e2a3259ebfdbef2b973848376bf6af6e0'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')

options=('!debug')

package() {
    install -Dm755 "${srcdir}/stuart" "${pkgdir}/usr/bin/stuart"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
