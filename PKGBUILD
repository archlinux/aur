# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=8.8.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_githuburl="https://github.com/simple-icons/simple-icons"
license=('CCO-1.0')
depends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}.tar.gz"
    "LICENSE::${_githuburl}/raw/develop/LICENSE.md")
sha256sums=('178b82a67e4e5ea66781cf22f56b2a7cc393e0b7c8190af5b572508b8552ac09'
            'ac89e4f528ce0f5c014c3e84609c290c197de6f9dc81f16df84df3980050ba23')
 
package() {
    install -Dm755 -d "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    cp -r "${srcdir}/${pkgname}-${pkgver}/icons/"* "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
