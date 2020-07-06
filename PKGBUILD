# Maintainer: Felix Golatofski <contact@xdfr.de>
# Co-Maintainer: DuckSoft <realducksoft at gmail dot com>

pkgname=trojan-qt5-appimage
provides=('trojan-qt5')
conflicts=('trojan-qt5')
pkgver=1.3.1
pkgrel=1
arch=('x86_64')
pkgdesc="A cross-platform Trojan GUI Client"
license=('GPL3')
url='https://github.com/TheWanderingCoel/Trojan-Qt5'
options=(!strip)
makedepends=('gendesk')
source=("$url/releases/download/v$pkgver/Trojan-Qt5-Linux.7z")
sha512sums=('0f75373939257771edee714a35d1fea298c9a0f437d6a35287c446946fd0fb84683e9352b96bc28c0ce51e4ae5388a592b7ff91f294461f876da6d041b7d7648')

prepare() {
    gendesk -f -n --pkgname trojan-qt5 --pkgdesc "${pkgdesc}" --categories "Network" --icon "trojan-qt5" --exec "/opt/Trojan-Qt5-Linux.AppImage"
}

package() {
    install -Dm755 Trojan-Qt5-Linux.AppImage -t "$pkgdir"/opt/
    install -Dm755 trojan-qt5.desktop -t "$pkgdir"/usr/share/applications/
}
