# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=adcd
pkgver=1.4
pkgrel=1
pkgdesc="A cd player for GNU/Linux with a ncurses (text mode) interface."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/"
license=('GPL2')
depends=('ncurses')
source=("http://mirror.lihnidos.org/GNU/savannah/$pkgname/$pkgname-$pkgver.tar.lz")
md5sums=('ff1ac19e9e88f8703dfdb8d53bd87452')
sha1sums=('86460d58295eb269a7014b87205d36f06ae0e932')
sha256sums=('165a3b58a599af060b55d2ae2b695c81220004ed97859d8b8d189b9aa4967c94')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

