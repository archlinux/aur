# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Zephyr

pkgname=kcm-servicemenus
pkgver=0.4
pkgrel=3
pkgdesc="KDE 4 System Settings module to manage service menus"
arch=('i686' 'x86_64')
depends=('kdelibs' 'qt4' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
url="http://www.kde-look.org/content/show.php/Service+Menu+Manager?content=94996"
license=('GPL')
source=(http://linux.wuertz.org/dists/sid/main/source/kcm-servicemenus_$pkgver.tar.gz)
md5sums=('d7fe4aa352c856c8f272c5b4c7330419')

build() {
  cd $srcdir/kcm-servicemenu/
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make
}

package() {
  cd $srcdir/kcm-servicemenu/
  make DESTDIR=${pkgdir} install
}
