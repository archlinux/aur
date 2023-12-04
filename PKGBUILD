# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gawk'
    'hicolor-icon-theme'
    'freetype2'
    'libpng'
    'libjpeg-turbo'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-research-v${pkgver}-ubuntu22.04.deb"
)
sha256sums=('01b330606ae6676942df0218545aa4a80c749e01f13f4e8fac874345684b6e66')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/"{include,lib}
}