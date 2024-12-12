# Maintainer: Spyros Stathopoulos <spystath@gmail.com>
pkgname=tktable
_pkgnameactual=TkTable
pkgver=2.12
pkgrel=1
pkgdesc="A full-featured 2D table widget for Tk."
arch=('i686' 'x86_64')
url="http://tktable.sourceforge.net/"
license=('custom')
depends=('tcl' 'tk')
_verstr=$(echo -ne $pkgver | tr "." "-")
# latest updated fork
source=("https://github.com/bohagan1/TkTable/archive/refs/tags/tktable-${_verstr}-0.tar.gz")
md5sums=('c52eb639854f09ba28005e13c5a8ff57')

build() {
  cd "$srcdir"
  cd "$_pkgnameactual-$pkgname-$_verstr-0"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"
  cd "$_pkgnameactual-$pkgname-$_verstr-0"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
