# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mogan-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_githuburl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
providers=()
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('qt5-svg' 'qt5-base' 'glibc' 'gcc-libs' 'gawk' 'perl' 'hicolor-icon-theme' 'sqlite' 'sh' \
    'freetype2' 'python' 'curl' 'zlib' 'libpng' 'libjpeg-turbo')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-ubuntu22.04.deb")
sha256sums=('957ee74dfe787ee576d9df4d0ba161fd9edcf0c86b445108d1521ab4f9b777e8')
 
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/include"
}