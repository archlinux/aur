# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.47
pkgrel=1
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=('x86_64')
url="http://sourceforge.jp/projects/yash/"
license=('GPL')
depends=('ncurses')
install=yash.install
source=("https://osdn.net/dl/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('931f2e7451d8b1eca2a98caeef7eda0527d96376f9f2c9bec90bc5938e39992e')

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
