# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=1.2.1
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
    'qt6-svg'
    'qt6-base'
    'openssl'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-research-v${pkgver}-ubuntu22.04.deb"
)
sha256sums=('269201fa56159825f1a9ac608abc07c27662826a2cd9f4ed34df7d9c32baa318')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/"{include,lib}
}