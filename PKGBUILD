# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_appname=com.51ifind
pkgver=1.10.12.380.001
pkgrel=3
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=('aarch64' 'x86_64')
url="https://www.51ifind.com/"
license=('custom::freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('nss' 'alsa-lib' 'at-spi2-core' 'libxfixes' 'dbus' 'libxext' 'mesa' 'glib2' 'libxcb' 'expat' 'util-linux-libs' \
    'glibc' 'nspr' 'libdrm' 'libx11' 'gcc-libs' 'libxkbcommon' 'libxcomposite' 'libxrandr' 'libcups' 'libxdamage' 'zlib' \
    'fontconfig' 'krb5' 'aspnet-runtime-6.0')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://resource.thsi.cn/download/iFinD/${_appname}_uos_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://resource.thsi.cn/download/iFinD/${_appname}_uos_${pkgver}_amd64_signed.deb")
sha256sums_aarch64=('28f751413c6805ef60926bd85ea7e47bef7e90f0d1ed63f80cccb7b4a3018eb2')
sha256sums_x86_64=('197ed21fffc7e1a117c28d582b37209d09990c0e7801b160e94733bbedc08be6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}