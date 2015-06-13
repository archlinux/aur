# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=tktable
_pkgnameactual=Tktable
pkgver=2.10
pkgrel=3
pkgdesc="A full-featured 2D table widget for Tk."
arch=('i686' 'x86_64') 
url="http://tktable.sourceforge.net/"
license=('custom')
depends=('tcl' 'tk')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${_pkgnameactual}${pkgver}.tar.gz")
md5sums=('ecdd96b39ad49b820bf084eb1c786f66')

build() {
  cd "$srcdir"
  # Fix the package name
  mv "$_pkgnameactual$pkgver" "$pkgname$pkgver"
  cd "$pkgname$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"
  cd "${pkgname}${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
