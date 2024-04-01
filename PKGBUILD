# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=11.11.0
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
sha256sums=('32a7cd9f98858ae51e38f0526089658d45ddb9eac840f89d3faf7c64afaf285b')
package() {
    install -Dm644 "${srcdir}/${pkgname}.git/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}