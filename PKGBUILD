# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=1.1.6
pkgrel=2
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-svg'
    'qt5-base'
    'gawk'
    'hicolor-icon-theme'
    'sqlite'
    'freetype2'
    'libpng'
    'libjpeg-turbo'
    'perl'
    'python'
    'curl'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-ubuntu22.04.deb"
)
sha256sums=('05582bad0bfab967d5ff810ebe170f10aad95586895454ff988d11cfde4f4856')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/include"
}