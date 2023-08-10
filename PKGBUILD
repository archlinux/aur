# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adbmanager-bin
pkgver=3.1
pkgrel=6
pkgdesc="ADB manager for Android devices"
arch=('x86_64')
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL3')
depends=('android-tools' 'iproute2' 'nmap' 'sakura' 'cairo' 'at-spi2-core' 'gdk-pixbuf2' 'glibc' 'libx11' 'pango' 'gtk2' 'glib2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx8_amd64.deb")
sha256sums=('9f72d0df060a7877088bee9cb81761fefa59ab8f11f01c7ab4d11855749d8725')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/"
    mv "${pkgdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt/"
    rm -rf "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    mv "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/pixmaps"
}