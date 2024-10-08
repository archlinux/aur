# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=13.13.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_ghurl="https://github.com/simple-icons/simple-icons"
license=('CC0-1.0')
conflicts=("${pkgname}")
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('f925cc0bdf6b0eb0ff23aab43fc540066eff6883c3422b3221b51d335679bfdc')
package() {
    find "${srcdir}/${pkgname}-${pkgver}/icons" -type f -name "*.svg" -exec install -Dm644 -t "${pkgdir}/usr/share/icons/${pkgname}/scalable" {} \;
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}