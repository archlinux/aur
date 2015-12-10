pkgname=kelbt
pkgver=0.16
pkgrel=1
pkgdesc="Tool for generating LALR parsers."
arch=('i686' 'x86_64')
url="http://www.complang.org/"
license=('GPL')
depends=('gcc-libs')
source=("http://www.colm.net/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4d85d72a6bf4a20ea2169e4a24bf16bc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
