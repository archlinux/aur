pkgname=cc-tool
pkgver=0.26
pkgrel=3
pkgdesc="Support for Texas Instruments CC Debugger"
arch=('x86_64')
url='http://sourceforge.net/projects/cctool/'
license=('GPL')
depends=('boost>=1.39.0')
source=( "http://downloads.sourceforge.net/project/cctool/$pkgname-$pkgver-src.tgz" )
sha512sums=('c297fd9e2d3afaf87450425dfa61866ac69f39e95b93e532829cfb53bb05e6f818fbfe33be115fbaa2ce8da947637366b1461316faf89a1ed5333d60002dd38d')

build() {
  CPPFLAGS=-P
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
