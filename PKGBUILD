# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.7.3
pkgrel=4
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=("x86_64")
license=("GPL2")
depends=('qt5-svg' 'openbabel' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('f3688d251897a844b089d8e27ca05fd3e96372a6c50f559e86c5c8f15520af04')

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../$_PkgName-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSK_INSTALL_LIBS64=/lib
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
