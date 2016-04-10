# Contributor: Amiad Bareli <amiad@hatul.info>
pkgname=libhdate-glib
libname=libhdate-glib
pkgver=0.5.0
pkgrel=3
pkgdesc="Gobject bindings for LibHdate. LibHdate is a small C,C++ library for Hebrew calendar, dates, holidays, and reading sequence (parasha)."
url="https://github.com/yaacov/libhdate-glib"
license=("GPL")
arch=('i686' 'x86_64')
depends=('libhdate>=1.6' 'vala')
makedepends=("gcc" "autoconf" "automake")
source=("https://github.com/yaacov/$libname/releases/download/v$pkgver/$libname-$pkgver.tar.bz2")
sha1sums=('07e1de96afdce84da1030c13ccab193e97d81292')

package() {
  cd $srcdir/$libname-$pkgver
  sed -i 's/ac_default_prefix=\/usr\/local/ac_default_prefix=\/usr/' ./configure
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir/ install
}
