#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
#Contributor: Carl Mueller arch at carlm e4ward com

pkgname=kdeplasma-applets-yawp
pkgver=0.4.5
pkgrel=5
pkgdesc="Colorful weather plasmoid"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/yawp/"
conflicts=('yawp-weather-plasmoid')
depends=('kdebase-workspace' 'gettext')
makedepends=('cmake' 'automoc4')
source=(http://downloads.sourceforge.net/yawp/yawp-$pkgver.tar.bz2)
license=('GPL')
sha256sums=('913e95b77694ca95961be7ff5aa179284f698b18fe22b5947017034970caa4c7')

prepare(){
  mkdir -p "$srcdir/yawp-$pkgver/build"
}
 
build() {
  cd "$srcdir/yawp-$pkgver/build"
  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make VERBOSE=1
}
 
package(){
  cd "$srcdir/yawp-$pkgver/build"
  make DESTDIR=$pkgdir install
}
