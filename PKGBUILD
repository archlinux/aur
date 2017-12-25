# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.46
pkgrel=2
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=('x86_64')
url="http://sourceforge.jp/projects/yash/"
license=('GPL')
depends=('ncurses')
install=yash.install
source=("https://osdn.net/dl/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('93431d897ce2b176c9f97b879c70a426ebc125b073d5894c00cd746f3a8455cb')

build() {
  cd $pkgname-$pkgver

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
  cd $pkgname-$pkgver

  make install DESTDIR="$pkgdir"
}
