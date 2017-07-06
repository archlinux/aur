# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.45
pkgrel=1
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/yash/"
license=('GPL')
depends=('ncurses')
install=yash.install
source=("https://de.osdn.net/projects/yash/downloads/67984/yash-${pkgver}.tar.xz")
sha256sums=('5b127d71e0e1edd462b224322c01332819a38eaa442baad807283e139ee56e11')

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
