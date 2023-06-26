# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="aechoterm-bin"
pkgver=4.0.0.0.2.7
pkgrel=3
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.
    闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=('aarch64' 'x86_64')
url="https://ec.nantian.com.cn/"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('nodejs' 'nss' 'lib32-gcc-libs' 'alsa-lib' 'at-spi2-core' 'python' 'gtk3' 'java-runtime' 'libcups' 'libxext' 'expat' 'mesa' \
    'gcc-libs' 'libxkbcommon' 'libx11' 'cairo' 'libdrm' 'dbus' 'libxrandr' 'libxdamage' 'glib2' 'libxcb' 'libxfixes' 'libxshmfence' \
    'hicolor-icon-theme' 'gdk-pixbuf2' 'lib32-glibc' 'pango' 'glibc' 'nspr' 'libxcomposite' 'sh')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://ec.cnd.nantiangzzx.com/${pkgname%-bin}_${pkgver%.0.2.7}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://ec.cnd.nantiangzzx.com/Aechoterm_${pkgver%.0.2.7}_amd64.deb")
sha256sums_aarch64=('b6c3ad256bdde7d31bcdf0125a47a4b6438e69d899ae6188d7ac1898dcb4f2fb')
sha256sums_x86_64=('3c1681aae8b3426577fbcab4401ba2af7a9f77152e1836029d9f45748ab58904')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    find "${pkgdir}/opt/Aechoterm/resources/app/node_modules/node-pty" -type f -exec chmod 644 {} \;
    install -Dm644 "${pkgdir}/opt/Aechoterm/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}