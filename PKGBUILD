# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="aechoterm-bin"
pkgver=4.0.0.0.2.7
pkgrel=2
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=('x86_64')
url="https://ec.nantian.com.cn/"
license=('unknown')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('nodejs' 'nss' 'lib32-gcc-libs' 'alsa-lib' 'at-spi2-core' 'python' 'gtk3' 'java-runtime' 'libcups' 'libxext' 'expat' 'mesa' \
    'gcc-libs' 'libxkbcommon' 'libx11' 'cairo' 'libdrm' 'dbus' 'libxrandr' 'libxdamage' 'glib2' 'libxcb' 'libxfixes' 'libxshmfence' \
    'hicolor-icon-theme' 'gdk-pixbuf2' 'lib32-glibc' 'pango' 'glibc' 'nspr' 'libxcomposite' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::https://ec.cnd.nantiangzzx.com/Aechoterm_${pkgver%.0.2.7}_amd64.deb")
sha256sums=('3c1681aae8b3426577fbcab4401ba2af7a9f77152e1836029d9f45748ab58904')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    find "${pkgdir}/opt/Aechoterm/resources/app/node_modules/node-pty" -type f -exec chmod 644 {} \;
    rm -rf "${pkgdir}/opt/Aechoterm/resources/app/node_modules/sshpk/man/man1/sshpk-conv.1" \
           "${pkgdir}/opt/Aechoterm/resources/app/node_modules/sshpk/man/man1/sshpk-sign.1" \
           "${pkgdir}/opt/Aechoterm/resources/app/node_modules/sshpk/man/man1/sshpk-verify.1" \
           "${pkgdir}/opt/Aechoterm/resources/app/node_modules/ajv/scripts/info" \
           "${pkgdir}/opt/Aechoterm/resources/app/node_modules/sshpk/man/man1"
}