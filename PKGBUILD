# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-cwp
_pkgname=cwp
pkgver=1.12.0
pkgrel=1
pkgdesc="Customizable weather plasmoid"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=98925"
license=('GPL3')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("http://kde-look.org/CONTENT/content-files/98925-$_pkgname-$pkgver.tar.bz2")
md5sums=('b05d9dec29a73629ae7fb07ac718bc2b')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$_pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
