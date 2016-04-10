# Contributor: Amiad Bareli <amiad@hatul.info>
pkgname=libhdate-glib
libname=libhdate-glib
pkgver=0.5.0
pkgrel=2
pkgdesc="Gobject bindings for LibHdate. LibHdate is a small C,C++ library for Hebrew calendar, dates, holidays, and reading sequence (parasha)."
url="http://libhdate-glib.googlecode.com"
license=("GPL")
arch=('i686' 'x86_64')
depends=('libhdate>=1.6' 'vala')
makedepends=("gcc" "autoconf" "automake")
source=(http://$libname.googlecode.com/files/$libname-$pkgver.tar.bz2)
md5sums=('072c55c3b5c9f1e8ac202f9fb70b41ac')

package() {
  cd $srcdir/$libname-$pkgver
  sed -i 's/ac_default_prefix=\/usr\/local/ac_default_prefix=\/usr/' ./configure
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir/ install
}
