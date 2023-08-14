# Maintainer: sukanka <su975853527 at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gstarcad-bin
_appname="com.${pkgname%-bin}.cad"
pkgver=23.1.1
pkgrel=3
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=('aarch64' 'armv7h' 'x86_64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('sh' 'libxxf86vm' 'libsm' 'hicolor-icon-theme' 'libxkbcommon' 'xcb-util-image' 'xdg-utils' 'xcb-util-keysyms' \
    'fontconfig' 'libcups' 'xcb-util-wm' 'libice' 'xcb-util-renderutil' 'qt5-base' 'freetype2' 'libxfixes' 'libxext' \
    'libxcb' 'gcc-libs' 'expat' 'mesa' 'libxdamage' 'libx11' 'zlib' 'systemd-libs' 'libxshmfence' 'qt5-svg' \
    'libxkbcommon-x11' 'libglvnd' 'glibc' 'libdrm')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://hccad.gstarcad.cn/linux2023/v3.0/v${pkgver}/deb/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::https://hccad.gstarcad.cn/linux2023/v3.0/v${pkgver}/deb/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://hccad.gstarcad.cn/linux2023/v3.0/v${pkgver}/deb/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('29de9bb281ada1a1f22e4b15b8e05e4ff1a588873b0f86b64e28db287d2c77f2')
sha256sums_armv7h=('29de9bb281ada1a1f22e4b15b8e05e4ff1a588873b0f86b64e28db287d2c77f2')
sha256sums_x86_64=('fe5abf637b282efe0822670e4bea11c6655b502a28b9132cdbfd10ce4d63f62a')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/apps/${pkgname%-bin}/v2023/files/Licenses/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}