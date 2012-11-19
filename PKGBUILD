pkgname=cc-tool
pkgver=0.22
pkgrel=1
pkgdesc="Support for Texas Instruments CC Debugger"
arch=('x86_64')
url='http://sourceforge.net/projects/cctool/'
license=('GPL')
depends=('boost>=1.34.0')
source=( "http://downloads.sourceforge.net/project/cctool/$pkgname-$pkgver.tgz" )
md5sums=('0bbb7509654d0ab34879acc5a888e5ce')

build() {
  cd "$srcdir/cc-tool"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/cc-tool"
  make -k check
}

package() {
  cd "$srcdir/cc-tool"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
