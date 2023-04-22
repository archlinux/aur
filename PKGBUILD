# Maintainer: sukanka <su975853527 at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname='gstarcad-bin'
_appname="com.gstarcad.cad"
pkgver=23.1
pkgrel=2
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=('x86_64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
depends=('glibc' 'libxcb' 'libsm' 'mesa' 'qt5-svg' 'xdg-utils' 'gcc-libs' 'sh' 'freetype2' 'xcb-util-renderutil' \
    'libxkbcommon-x11' 'libxshmfence' 'libxkbcommon' 'libice' 'expat' 'libxext' 'systemd-libs' 'libdrm' 'libxfixes' \
    'libxxf86vm' 'mono' 'fontconfig' 'libcups' 'libxdamage' 'libglvnd' 'zlib' 'xcb-util-wm' 'xcb-util-keysyms' \
    'libx11' 'qt5-base' 'xcb-util-image')
optdepends=()
options=(!strip)
source=("${pkgname}-${pkgver}.deb::https://hccad.gstarcad.cn/linux2023/v${pkgver}/uos/signed_${_appname}_${pkgver}_amd64.deb")
sha256sums=('3400c8d30e809539d1eb65e05ef63efc3e581c106cb6d6a7e495c2c71665e636')
package(){
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info" "${pkgdir}/opt/apps/${_appname}/entries/autostart"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/license.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}