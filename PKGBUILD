# Maintainer: Antonio Rojas < arojas@archlinux.org >
# Contributor: Jan Valiska <jan.valiska@gmail.com>

pkgname=kde-servicemenus-rootactions
pkgver=2.8.6
pkgrel=2
pkgdesc="Allows admin users to perform several root only actions from dolphin via kdesu/kdesudo"
arch=(any)
url="http://www.kde-apps.org/content/show.php?content=48411"
license=(GPL)
depends=(dolphin kdebase-kdialog)
source=("http://www.kde-apps.org/CONTENT/content-files/48411-rootactions_servicemenu_$pkgver.tar.gz")
md5sums=('477d9601e6aa8c0b3ec35ab97efdcae1')

package() {
  cd rootactions_servicemenu_$pkgver/Root_Actions_$pkgver/dolphin-KDE4/
  mkdir -p "$pkgdir"/usr/share/kservices5/ServiceMenus
  install -Dm755 *.desktop "$pkgdir"/usr/share/kservices5/ServiceMenus/
  cd ../krusader-KDE4
  install -Dm644 krusader_rootactions.xml "$pkgdir"/usr/share/apps/krusader/krusader_rootactions.xml
  cd ..
  install -Dm755 rootactions-servicemenu.pl "$pkgdir"/usr/bin/rootactions-servicemenu.pl
} 
