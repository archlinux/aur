# Maintainer: zhullyb <zhullyb [at] outlook [dot] com>
pkgname=wechat-devtools-bin
pkgver=2.01.2510290_2
pkgrel=1
epoch=2
pkgdesc="WeChat Devtools For Linux."
license=("MIT")
arch=("x86_64")
url="https://github.com/msojocs/wechat-web-devtools-linux"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gconf" "libxkbfile")
options=("!strip")
source=(
    "https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${pkgver//_/-}/WeChat_Dev_Tools_v${pkgver//_/-}_x86_64_linux.tar.gz"
    "wechat-devtools.desktop"
    "wechat-devtools.svg"
)
md5sums=('1bc844e146765194fe45505049111f58'
         '08b27001217b9732289cd0e33f8f8d58'
         '945fac0a68c298b66f3808f2f1694c98')

package() {
    mkdir -p ${pkgdir}/opt/wechat-devtools ${pkgdir}/usr/bin
    cp -r ${srcdir}/WeChat_Dev_Tools_v${pkgver//_/-}_x86_64_linux/* ${pkgdir}/opt/wechat-devtools
    ln -s /opt/wechat-devtools/bin/{wechat-devtools,wechat-devtools-cli} ${pkgdir}/usr/bin/

    install -Dm644 ${srcdir}/wechat-devtools.desktop ${pkgdir}/usr/share/applications/wechat-devtools.desktop
    install -Dm644 ${srcdir}/wechat-devtools.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg
}
