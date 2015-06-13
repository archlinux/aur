# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=qtrans
pkgver=0.2.2.6
pkgrel=2
pkgdesc="QTrans is a word translator for KDE4. It uses Babylon (*.dic) dictionaries and translates many languages."
url="http://www.kde-apps.org/content/show.php/QTrans?content=74876"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime') 
makedepends=('cmake' 'automoc4')
source=(http://www.kde-apps.org/CONTENT/content-files/74876-qtrans-$pkgver.tar.gz)
md5sums=('403742e73f9c95d75314a73a820cee45')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4 . 
  make clean 
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
