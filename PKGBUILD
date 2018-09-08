# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Parastatidis <nparasta@auth.gr>

pkgname=libenglab
pkgver=0.3.0
pkgrel=4
pkgdesc="Main library for Englab, a mathematical platform" 
url="http://www.englab.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gsl')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
sha256sums=('5b17c104f59981e4de768e1c384c43ea10780208643e7ea5c8ea9d6e049ab16a')

build() {
  cd $pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
