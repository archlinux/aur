# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=9.2.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_githuburl="https://github.com/simple-icons/simple-icons"
license=('CCO-1.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}.tar.gz"
    "LICENSE.md::https://raw.githubusercontent.com/simple-icons/simple-icons/develop/LICENSE.md")
sha256sums=('bfd97374d2094c447b109b214cb3aa813ba093926b264cf20fb11d32bad0571d'
            '4674b210d8a1a0926e070843950aef43367cf44dcac86081c25540e03c089e58')
 
package() {
    install -Dm755 -d "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    cp -r "${srcdir}/${pkgname}-${pkgver}/icons/"* "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}