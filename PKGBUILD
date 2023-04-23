# Contributor: Colin Drake <colin.f.drake@gmail.com>
pkgname=emact
pkgver=2.58.0
pkgrel=1
pkgdesc="A portable emacs clone for X Windows or terminal with a lisp interpreter."
arch=('i686' 'x86_64')
url="http://christian.jullien.free.fr/emacs/"
license=('GPL')
depends=('ncurses' 'libx11')
source=("http://www.eligis.com/emacs/$pkgname-$pkgver.tar.gz")
sha256sums=('1b9102724254e3a419f3907d07827d141a8684178241fd36d384a745141273bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr 
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL="$pkgdir/usr/" install
}
