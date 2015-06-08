# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=openlibm
pkgver=0.4.1
pkgrel=1
pkgdesc="standalone implementation of C mathematical functions"
arch=(i686 x86_64)
url="https://github.com/JuliaLang/$pkgname"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d6269849348027b0a02ef5f7707968185017b4bb9607acd2fd7348ba28c69833')

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
