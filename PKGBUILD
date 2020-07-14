# Maintainer: Felix Golatofski <contact@xdfr.de>
# Co-Maintainer: DuckSoft <realducksoft at gmail dot com>

pkgname=trojan-qt5-appimage
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
pkgdesc="A cross-platform Trojan GUI Client"
license=('GPL3')
url='https://github.com/TheWanderingCoel/Trojan-Qt5'
options=(!strip)
makedepends=('gendesk')
provides=('trojan-qt5')
conflicts=('trojan-qt5')
source=("$url/releases/download/v$pkgver/Trojan-Qt5-Linux.7z")
sha512sums=('964830f6fc18512a4d409bfeaab5b6f1f0c63b26d44dd3d8330021e5ccfe47abd620da5fb357c9e844ca27cf0730973b41f40c13518d397893220895f42f0300')

prepare() {
    gendesk -f -n --pkgname trojan-qt5 --pkgdesc "${pkgdesc}" --categories "Network" --icon "trojan-qt5" --exec "/opt/Trojan-Qt5-Linux.AppImage"
}

package() {
    install -Dm755 Trojan-Qt5-Linux.AppImage -t "$pkgdir"/opt/
    install -Dm755 trojan-qt5.desktop -t "$pkgdir"/usr/share/applications/
}
