# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=11.13.0
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
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('16d207b8aa26d03e44a899a3446b9c42af53bfbde89526251e6d59f6a5a405a7')
package() {
    install -Dm644 "${srcdir}/${pkgname}.git/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}