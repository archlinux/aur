# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xbyyunpan-bin"
pkgver=3.11.16
pkgrel=1
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
provides=("aliyunpan-liupan1890")
conflicts=("${pkgname%-bin}" "aliyunpan-liupan1890" "aliyunpan-odomu")
depends=('alsa-lib' 'glibc' 'libxdamage' 'pango' 'libxrandr' 'libxext' 'libxcb' 'libx11' 'libxcomposite' 'libxkbcommon' 'gcc-libs' 'nss' \
    'libxfixes' 'at-spi2-core' 'libdrm' 'cairo' 'gtk3' 'glib2' 'nspr' 'wayland' 'libcups' 'expat' 'mesa' 'hicolor-icon-theme' 'dbus')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/XBYDriver-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/XBYDriver-${pkgver}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/XBYDriver-${pkgver}-linux-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/main/LICENSE")
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009')
sha256sums_aarch64=('20d9b3386701df20159199633320f3cfdd1877f140b7efb11a4f38071a82168e')
sha256sums_armv7h=('72d78da8df5ca35432264808a7f1e902f878bde9ffe260cd59dca3f85e703fcd')
sha256sums_x86_64=('bc772429eedde65a8866a81ac2a21faa6c84d92e323dfdd4e9ccecf7e58c6dec')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/opt/小白羊云盘" "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/小白羊云盘|/opt/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}