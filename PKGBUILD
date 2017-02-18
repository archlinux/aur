# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.44
pkgrel=1
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/yash/"
license=('GPL')
depends=('ncurses')
install=yash.install
source=("https://de.osdn.net/projects/yash/downloads/66984/yash-${pkgver}.tar.xz")
sha256sums=('f1352b49195a3879284e3ab60af4b30d3a87d696c838b246e2068ccbdfcf2e66')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-array \
    --enable-dirstack \
    --enable-help \
    --enable-history \
    --enable-lineedit \
    --enable-nls \
    --enable-printf \
    --enable-socket \
    --enable-test \
    --enable-ulimit
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
