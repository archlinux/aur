# Maintainer: Antonio Rojas < arojas@archlinux.org >
# Contributor: Jan Valiska <jan.valiska@gmail.com>

pkgname=kde-servicemenus-rootactions
pkgver=2.9.1
pkgrel=1
pkgdesc="Allows admin users to perform several root only actions from dolphin via kdesu/kdesudo"
arch=(any)
url="https://www.kde-look.org/content/show.php/Root+Actions+Servicemenu?content=48411"
license=(GPL)
depends=(dolphin kdialog)
source=("https://dl.opendesktop.org/api/files/download/id/1485341541/rootactions_servicemenu_$pkgver.tar.gz")
md5sums=('44769ab05560bb1ba5a69a30be8b1c92')

package() {
  cd rootactions_servicemenu_$pkgver/Root_Actions_$pkgver/dolphin-KDE4/
  mkdir -p "$pkgdir"/usr/share/kservices5/ServiceMenus
  install -Dm755 *.desktop "$pkgdir"/usr/share/kservices5/ServiceMenus/
  cd ../krusader-KDE4
  install -Dm644 krusader_rootactions.xml "$pkgdir"/usr/share/krusader/krusader_rootactions.xml
  cd ..
  install -Dm755 rootactions-servicemenu.pl "$pkgdir"/usr/bin/rootactions-servicemenu.pl
} 
