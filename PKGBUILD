pkgname=dico
pkgver=2.2
pkgrel=1
pkgdesc="GNU Dico is a flexible modular implementation of DICT server (RFC 2229). In contrast to another implementations, it does not depend on particular database format. GNU Dico handles database accesses using loadable modules."
arch=('any')
url="ftp://download.gnu.org.ua/pub/release/$pkgname"
license=(GPLv3)
depends=('libtool>=2.4.6' 'pcre>=8.38' 'guile>=2.0' 'python2>=2.7.11' 'gettext>=0.19.7')
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
