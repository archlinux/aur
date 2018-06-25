# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>

pkgname=openlibm
pkgver=0.6.0
pkgrel=1
pkgdesc="standalone implementation of C mathematical functions"
arch=(i686 x86_64)
url="http://openlibm.org/"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d45439093d1fd15e2ac3acf69955e462401c7a160d3330256cb4a86c51bdae28')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s@/usr/local@/usr@" Make.inc
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
