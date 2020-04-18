# Maintainer: DuckSoft <realducksoft at gmail dot com>

pkgname=trojan-qt5-appimage
provides=('trojan-qt5')
conflicts=('trojan-qt5')
pkgver=0.0.8
pkgrel=1
arch=('x86_64')
pkgdesc="A cross-platform Trojan GUI Client"
license=('GPL3')
url='https://github.com/TheWanderingCoel/Trojan-Qt5'
options=(!strip)
makedepends=('gendesk')
source=("$url/releases/download/v$pkgver/Trojan-Qt5-Linux.AppImage")
sha512sums=('SKIP')

prepare() {
    gendesk -f -n --pkgname trojan-qt5 --pkgdesc "${pkgdesc}" --categories "Network" --icon "trojan-qt5" --exec "/opt/Trojan-Qt5-Linux.AppImage"
}

package() {
    install -Dm755 Trojan-Qt5-Linux.AppImage -t "$pkgdir"/opt/
    install -Dm755 trojan-qt5.desktop -t "$pkgdir"/usr/share/applications/
}
