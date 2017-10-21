# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=openlibm
pkgver=0.5.5
pkgrel=1
pkgdesc="standalone implementation of C mathematical functions"
arch=(i686 x86_64)
url="http://openlibm.org/"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('07dcc5f59e695fb45167c81406b8e201c5ad91ebf24e3e55ae13298670910cfd')

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
