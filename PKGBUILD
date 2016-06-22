pkgname=dico
pkgver=2.2
pkgrel=1
pkgdesc="GNU Dico is a flexible modular implementation of DICT server (RFC 2229)."
arch=('any')
url="ftp://download.gnu.org.ua/pub/release/$pkgname"
license=(GPLv3)
depends=()
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('45145e4790ce64332b2d8e842ce5f957')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  patch -p1 < ../../stdio.patch
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
