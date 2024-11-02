# Maintainer: awsl1414 <awsl1414@qq.com>
pkgname=wechat-devtools-git
pkgver=1.06.2409140
pkgrel=1
pkgdesc="WeChat Devtools For Linux. This version is unofficial."
license=("MIT")
arch=("x86_64")
url="https://github.com/msojocs/wechat-web-devtools-linux"
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=("gconf" "libxkbfile" "inetutils")
options=("!strip")
source=(
    "https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${pkgver}-${pkgrel}/WeChat_Dev_Tools_v${pkgver}-${pkgrel}_x86_64_linux.tar.gz"
    "wechat-devtools.desktop"
    "wechat-devtools.svg"
)
md5sums=(
    '6276e850ed9188a4717c3219083a1ca2'
    '08b27001217b9732289cd0e33f8f8d58'
    'cd6a5d400025355a7c3d1156dea424c8'
)

package() {

    install -dm755 "${pkgdir}/opt/wechat-devtools"
    cp -r ${srcdir}/WeChat_Dev_Tools_v${pkgver}-${pkgrel}_x86_64_linux/* ${pkgdir}/opt/wechat-devtools

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s /opt/wechat-devtools/bin/wechat-devtools ${pkgdir}/usr/bin/
    ln -s /opt/wechat-devtools/bin/wechat-devtools-cli ${pkgdir}/usr/bin/

    install -Dm644 ${srcdir}/wechat-devtools.desktop ${pkgdir}/usr/share/applications/wechat-devtools.desktop
    install -Dm644 ${srcdir}/wechat-devtools.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg
}
