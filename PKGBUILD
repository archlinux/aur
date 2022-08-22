# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Antonio Rojas < arojas@archlinux.org >
# Contributor: Jan Valiska <jan.valiska@gmail.com>

pkgname=kde-servicemenus-rootactions
pkgver=2.9.1
pkgrel=2
pkgdesc="Allows admin users to perform several root only actions from dolphin via kdesu/kdesudo"
arch=(any)
url="https://store.kde.org/p/998469/"
license=(GPL)
depends=(dolphin kde-cli-tools kdialog perl)
source=("https://buzo.eu/mirror/kde/rootactions_servicemenu_$pkgver.tar.gz")
sha256sums=('8c02e552d6d18246235e3141eebd02b125fad15717660dfa231b629a14837f65')

package() {
    cd "rootactions_servicemenu_$pkgver/Root_Actions_$pkgver/dolphin-KDE4"
    mkdir -p "$pkgdir"/usr/share/kservices5/ServiceMenus
    install -Dm755 *.desktop "$pkgdir"/usr/share/kservices5/ServiceMenus/
    cd ../krusader-KDE4
    install -Dm644 krusader_rootactions.xml "$pkgdir"/usr/share/krusader/krusader_rootactions.xml
    cd ..
    install -Dm755 rootactions-servicemenu.pl "$pkgdir"/usr/bin/rootactions-servicemenu.pl
} 
