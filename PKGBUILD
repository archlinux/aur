# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Parastatidis <nparasta@auth.gr>

pkgname=englab
pkgver=0.3.0
pkgrel=2
pkgdesc="Mathematical platform with a C like syntax, console interface" 
url="http://www.englab.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libenglab')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('2d93fa4d22967921be43b33631ccf530')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
