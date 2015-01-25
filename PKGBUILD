# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=makro
pkgver=1.0
pkgrel=4
pkgdesc="A simple KDE4 frontend for Xnee and Xbindkeys."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/Makro?content=88647"
license=('GPL')
depends=('kdelibs' 'xbindkeys')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-apps.org/CONTENT/content-files/88647-makro.tar.gz)
md5sums=('43f286516fd24890b222054b3931d5fa')

build() {

cd $startdir/src/makro
mkdir build
cd backend
qmake || return 1
make || return 1
cp ./makrod ../

cd ..
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ../ || return 1
make DESTDIR=$startdir/pkg install || return 1

}
