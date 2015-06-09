# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de

pkgname=libtecla
pkgver=1.6.3
pkgrel=1
pkgdesc="Interactive command line editing facilities"
arch=('i686' 'x86_64')
url='http://www.astro.caltech.edu/~mcs/tecla/'
license=('custom:X11')
depends=('ncurses')
options=(!makeflags)
source=("${url}$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make 
}
package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 444 LICENSE.TERMS "$pkgdir/usr/share/licenses/$pkgname"
}

md5sums=('90105ca19e405fb92825a90978e4ab18')
