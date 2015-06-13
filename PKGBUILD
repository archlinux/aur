# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=tcltrf
_pkgnameactual=trf
pkgver=2.1.4
pkgrel=2
pkgdesc="Trf is an extension library to the script language Tcl, as created by John Ousterhout."
arch=('i686' 'x86_64') 
url="http://tcltrf.sourceforge.net/"
license=('custom')
depends=('tcl')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${_pkgnameactual}${pkgver}.tar.bz2")
md5sums=('624dc7b112886fd006664ac377da2391')

build() {
  cd "$srcdir"
  # Fix the package name
  mv "$_pkgnameactual$pkgver" "$pkgname$pkgver"
  cd "$pkgname$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"
  cd "$pkgname$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
