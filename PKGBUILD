# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=cpc
pkgver=0.9.1
pkgrel=1
pkgdesc="Continuation passing C compiler."
arch=('i686' 'x86_64')
url="http://www.pps.univ-paris-diderot.fr/~kerneis/software/cpc/"
license=('GPL')
#depends=()
#optdepends=()
makedepends=('ocaml')
source=(http://www.pps.univ-paris-diderot.fr/~kerneis/software/files/$pkgname-$pkgver.tar.gz)
md5sums=('d8a9114d5d8f084cd8d703a2849c0cc3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make testcpc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


