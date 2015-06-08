# Contributor: ReNoM <renom@list.ru>
# Contributor: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=kde-cdemu-manager
pkgver=0.5
pkgrel=3
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KDE+CDEmu+Manager?content=99752"
license="GPL"
depends=('kdelibs' 'cdemu-daemon>=2.0')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-apps.org/CONTENT/content-files/99752-kde_cdemu-$pkgver.0.tar.bz2)
md5sums=('c0e56401e2c2f2c4652915a44af128b8')

build() {
  cd $srcdir/kde_cdemu
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package()
{
  cd $srcdir/kde_cdemu/build
  make DESTDIR=$pkgdir install
}

