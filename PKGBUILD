# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.7.2
pkgrel=1
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=("x86_64")
license=("GPL2")
depends=('qt5-svg' 'openbabel' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('1c6911163f7648aa0e0e4cafc1709cb1d30328c3c0131d6ad2e44e25e1c48f3f')

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake "../$_PkgName-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSK_INSTALL_LIBS64=/lib
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
