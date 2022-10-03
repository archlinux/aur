# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.7.3
pkgrel=2
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=("x86_64")
license=("GPL2")
depends=('qt5-svg' 'openbabel' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('9355afbea023a3ddedbcc3f9f0b094d403b7a59ae7141f8580a6597b5eb97f4c')

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ".." \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSK_INSTALL_LIBS64=/lib
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
