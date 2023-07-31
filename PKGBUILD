# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mogan-bin"
pkgver=1.1.4
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_githuburl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-svg' 'qt5-base' 'glibc' 'gcc-libs' 'gawk' 'hicolor-icon-theme' 'sqlite' 'sh' 'freetype2' 'zlib' 'libpng' 'libjpeg-turbo' 'perl' 'python' 'curl')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-ubuntu22.04.deb")
sha256sums=('ceb9cb30f1f55380615d9c920c9a247c1d86ce845c16a546a75336d6b4a38a99')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/include"
}