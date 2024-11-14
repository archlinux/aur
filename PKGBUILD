# Maintainer: kumax <kumax2048@pm.me>
pkgname=wechat-devtools-bin
pkgver=1.06.2409140_1
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
md5sums=('6276e850ed9188a4717c3219083a1ca2'
         '08b27001217b9732289cd0e33f8f8d58'
         '945fac0a68c298b66f3808f2f1694c98')

package() {
    mkdir -p ${pkgdir}/opt/wechat-devtools ${pkgdir}/usr/bin
    cp -r ${srcdir}/WeChat_Dev_Tools_v${pkgver//_/-}_x86_64_linux/* ${pkgdir}/opt/wechat-devtools
    ln -s /opt/wechat-devtools/bin/* ${pkgdir}/usr/bin/

    install -Dm644 ${srcdir}/wechat-devtools.desktop ${pkgdir}/usr/share/applications/wechat-devtools.desktop
    install -Dm644 ${srcdir}/wechat-devtools.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg
}
