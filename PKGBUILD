# Maintainer: Felix Golatofski <contact@xdfr.de>
# Co-Maintainer: DuckSoft <realducksoft at gmail dot com>

pkgname=trojan-qt5-appimage
provides=('trojan-qt5')
conflicts=('trojan-qt5')
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
pkgdesc="A cross-platform Trojan GUI Client"
license=('GPL3')
url='https://github.com/TheWanderingCoel/Trojan-Qt5'
options=(!strip)
makedepends=('gendesk')
source=("$url/releases/download/v$pkgver/Trojan-Qt5-Linux.7z")
sha512sums=('7e60da4ed4e9eb62cfebced5821384930b516ff274e37ccfcdeb51b66fecfdb0736ea745885b4fb7fc7b9bd0316718e1ff12be780e12c282f626be9750a08075')

prepare() {
    gendesk -f -n --pkgname trojan-qt5 --pkgdesc "${pkgdesc}" --categories "Network" --icon "trojan-qt5" --exec "/opt/Trojan-Qt5-Linux.AppImage"
}

package() {
    install -Dm755 Trojan-Qt5-Linux.AppImage -t "$pkgdir"/opt/
    install -Dm755 trojan-qt5.desktop -t "$pkgdir"/usr/share/applications/
}
