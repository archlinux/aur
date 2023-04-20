# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=masterpdfeditor-bin
_appname=master-pdf-editor
pkgver=5.9.40
pkgrel=1
pkgdesc="金山文档"
arch=('x86_64')
url="https://code-industry.net/masterpdfeditor"
license=('custom')
provides=()
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'qt5-svg' 'glibc' 'libglvnd' 'qt5-base' 'zlib' 'sane' 'qt5-declarative' 'gcc-libs')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::https://code-industry.net/public/${_appname}-${pkgver}-qt5.x86_64.deb")
sha256sums=('2d6a40fa3921348cf73ad103eb48b3ed329a41bf254ade8f4c437bce5bb2c135')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's|/opt/master-pdf-editor-5/masterpdfeditor5.png|masterpdfeditor5|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}5.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}-5/license_en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}