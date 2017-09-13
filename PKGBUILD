# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miam-player
pkgver=0.8.0
pkgrel=4
pkgdesc="Cross-platform open source music player"
arch=('i686' 'x86_64')
url="https://github.com/MBach/Miam-Player"
license=('GPL3')
depends=('qtav' 'qt5-multimedia' 'qt5-x11extras' 'taglib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MBach/Miam-Player/archive/v$pkgver.tar.gz")
sha256sums=('598355e2eaee42878ce797186fc1ff9b8dd8aa11019ba58763f79b9d1d34538b')

build() {
  cd Miam-Player-$pkgver
  qmake-qt5
  make
}

package() {
  cd Miam-Player-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
