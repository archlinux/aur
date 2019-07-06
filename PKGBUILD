# Contributor: Jack <nim901@gmail.com>
# Contributor: Ido Kanner <idokan@gmail.com>
pkgname=libhdate
libname=libhdate
pkgver=1.6.02
libver=1.0.6
pkgrel=5
pkgdesc="LibHdate is a small C,C++ library for Hebrew calendar and dates, holidays, and reading sequence"
url="http://libhdate.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=("gcc" "autoconf" "automake")
provides=('libhdate')
conflict=('libhdate')
source=(http://downloads.sourceforge.net/project/$libname/$libname/$libname-$pkgver/$libname-$pkgver.tar.bz2)
md5sums=('0376b7ad2df71a093343d04f51b9b510')

build() {
  cd "${srcdir}/${libname}-${pkgver}"
  # We install only the library not the binding features
  ./configure --prefix=/usr --disable-fpc --disable-gpc --disable-python --disable-ruby --disable-php --disable-perl
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
