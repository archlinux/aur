# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_githuburl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-svg' 'qt5-base' 'glibc' 'gcc-libs' 'gawk' 'hicolor-icon-theme' 'sqlite' 'sh' 'freetype2' 'zlib' 'libpng' 'libjpeg-turbo' 'perl' 'python' 'curl')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-ubuntu22.04.deb")
sha256sums=('6d3d19b33d80b133e5b7193d65b14a361175df9505c9f00326a3a61095489611')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/include"
}