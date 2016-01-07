# Maintainer: Antonio Rojas < arojas@archlinux.org >
# Contributor: Jan Valiska <jan.valiska@gmail.com>

pkgname=kde-servicemenus-rootactions
pkgver=2.8.7
pkgrel=1
pkgdesc="Allows admin users to perform several root only actions from dolphin via kdesu/kdesudo"
arch=(any)
url="http://www.kde-apps.org/content/show.php?content=48411"
license=(GPL)
depends=(dolphin kdebase-kdialog)
source=("http://www.kde-apps.org/CONTENT/content-files/48411-rootactions_servicemenu.tar.gz")
md5sums=('412a4e659514a6404691b552f2416ce0')

package() {
  cd rootactions_servicemenu_$pkgver/Root_Actions_$pkgver/dolphin-KDE4/
  mkdir -p "$pkgdir"/usr/share/kservices5/ServiceMenus
  install -Dm755 *.desktop "$pkgdir"/usr/share/kservices5/ServiceMenus/
  cd ../krusader-KDE4
  install -Dm644 krusader_rootactions.xml "$pkgdir"/usr/share/apps/krusader/krusader_rootactions.xml
  cd ..
  install -Dm755 rootactions-servicemenu.pl "$pkgdir"/usr/bin/rootactions-servicemenu.pl
} 
