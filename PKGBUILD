# Maintainer: sukanka <su975853527 at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname='gstarcad-bin'
_appname="com.gstarcad.cad"
pkgver=23.1
pkgrel=1
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=('x86_64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
depends=(glibc libxcb libsm mesa qt5-svg xdg-utils gcc-libs bash freetype2 xcb-util-renderutil libxkbcommon-x11 libxshmfence libxkbcommon libice expat libxext \
    systemd-libs libdrm libxfixes libxxf86vm mono fontconfig libcups libxdamage libglvnd zlib xcb-util-wm xcb-util-keysyms libx11 qt5-base xcb-util-image )
optdepends=()
source=("${pkgname}-${pkgver}.deb::https://hccad.gstarcad.cn/linux2023/v${pkgver}/uos/signed_${_appname}_${pkgver}_amd64.deb"
    "LICENSE::https://static.gstarcad.com/attached/pdf/20230303/2280504f-9d17-4d0b-bc1b-2125906897a0.pdf")
sha256sums=('3400c8d30e809539d1eb65e05ef63efc3e581c106cb6d6a7e495c2c71665e636'
            'ffa4b7f3759bbf1f635dd95232ee7193802f27e83fa91f7d6a22c8099e64bcbb')
package(){
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    rm -rf "${pkgdir}/opt/apps/com.gstarcad.cad/info"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}