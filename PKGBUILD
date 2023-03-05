# Maintainer: sukanka <su975853527 at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname='gstarcad-bin'
_pkgname="com.gstarcad2023.cad"
pkgver=23.0.2
pkgrel=2
epoch=
pkgdesc="浩辰 CAD"
arch=('x86_64')
license=('unknown')
url="https://www.gstarcad.com/cad_linux/"
provides=()
depends=(openssl-1.0 qt5-svg hicolor-icon-theme)
optdepends=()
source=("${pkgname}-${pkgver}.deb::https://hccad.gstarcad.cn/linux2023/v${pkgver}/uos/signed_${_pkgname}_${_pkgname}_amd64.deb")
sha256sums=('1aaa224365cc439a98a1071eecde9834b79999a52e76f2f6fbf60ad7c4c3aafd')
package(){
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    chmod 644 "${pkgdir}/opt/apps/${_pkgname}/files/libcurl.a"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/gcad.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gcad.svg"
}
