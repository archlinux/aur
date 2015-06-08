# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kbackgammon
_pkgname=backgammon
pkgver=0.18
_pkgver=018
pkgrel=2
pkgdesc="Backgammon game for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KBackgammon?content=142680"
license=('GPL')
depends=('kdebase-runtime' 'libkdegames')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/142680-${_pkgname}_${_pkgver}.tar.gz")
install=$pkgname.install
md5sums=('4c3a404f80e12b67c34f8da23159a4d4')

build() {
  cd ${_pkgname}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="$pkgdir" install
}
