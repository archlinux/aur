# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-cwp
_pkgname=cwp
pkgver=1.12.1
pkgrel=1
pkgdesc="Customizable weather plasmoid"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=98925"
license=('GPL3')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("http://kde-look.org/CONTENT/content-files/98925-$_pkgname-$pkgver.tar.bz2")
md5sums=('d7d13388dc415b84c4d9265599527bb5')

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
