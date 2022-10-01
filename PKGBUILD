# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.7.3
pkgrel=1
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=("x86_64")
license=("GPL2")
depends=('qt5-svg' 'openbabel' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('68fb099690db5492183dc5c512116bb1c5ce4f9bec77aafbcfe65424703c2974')

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
