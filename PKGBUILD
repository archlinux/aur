pkgname=cc-tool
pkgver=0.26
pkgrel=1
pkgdesc="Support for Texas Instruments CC Debugger"
arch=('x86_64')
url='http://sourceforge.net/projects/cctool/'
license=('GPL')
depends=('boost>=1.34.0')
source=( "http://downloads.sourceforge.net/project/cctool/$pkgname-$pkgver-src.tgz" )
md5sums=('26960676f3e6264e612c299fbf8ec5ea')

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
