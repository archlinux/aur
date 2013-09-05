# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=wmcalc
pkgver=0.3
pkgrel=3
pkgdesc="Dockapp that performs all the functions (and eventually more) of a simple four function calculator"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/130"
license=('GPL')
groups=('x11')
depends=('libxpm')
source=("http://dockapps.windowmaker.org/download.php/id/455/$pkgname-$pkgver.tar.gz")
md5sums=('23ecf19e956d19ef9dddb810989666c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make clean
  make INCLUDES=-I/usr/include/X11
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 .wmcalc "$pkgdir/usr/share/doc/$pkgname/wmcalc.example"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
