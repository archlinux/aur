# Maintainer: ilovesusu

pkgname=apifox-latest
pkgver=2.1.29
pkgrel=1
pkgdesc="API 文档、API 调试、API Mock、API 自动化测试"
arch=("x86_64")
url="https://www.apifox.cn/"
license=('custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
source=(
        "https://cdn.apifox.cn/download/Apifox-linux-latest.zip"
        "apifox.desktop")
sha256sums=(
        '1c1e53924bb955ded5a24241c431f93ec73fb497ebdc548fdf508a3dc243a86f'
        '538bd986b582053799128254b4fcd6edfd51d096b127cf6398555664497d76b0')
options=(!strip)

package() {
        install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/opt/apifox/Apifox.AppImage"
        install -Dm644 "${srcdir}/apifox.desktop" "${pkgdir}/usr/share/applications/apifox.desktop"
        mkdir -p "${pkgdir}/usr/bin"
        ln -sf "${pkgdir}/opt/apifox/Apifox.AppImage" "${pkgdir}/usr/bin"
}
