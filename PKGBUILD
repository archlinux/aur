# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=11.9.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_ghurl="https://github.com/simple-icons/simple-icons"
license=('CC0-1.0')
conflicts=("${pkgname}")
makedepends=(
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('011f33ec356b96cd29233a3cc43e09ca5b57b12f415e40bc4ef29700b18cbc26')
package() {
    install -Dm644 "${srcdir}/${pkgname}.git/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}