# Contributor: Colin Drake <colin.f.drake@gmail.com>
pkgname=emact
pkgver=2.54.0
pkgrel=2
pkgdesc="A portable emacs clone for X Windows or terminal with a lisp interpreter."
arch=('i686' 'x86_64')
url="http://christian.jullien.free.fr/emacs/"
license=('GPL')
depends=('libx11')
source=("http://www.eligis.com/emacs/$pkgname-$pkgver.tar.gz")
md5sums=('b43e9e745a129ab3578e9e2b06eb8b6d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL="$pkgdir/usr/" install
}
