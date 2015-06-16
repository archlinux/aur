# Maintainer: Samed Beyribey <ras0ir AT eventualis dot org>
pkgname=tclxosd
pkgver=0.20
pkgrel=2
pkgdesc="A Tcl bindings for libxosd (On Screen Display)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tclxosd/"
license=('GPL')
makedepends=('xosd' 'tcl')
source=(http://downloads.sourceforge.net/project/tclxosd/tclxosd/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 $pkgdir/usr/lib/$pkgname
  install -dm755 $pkgdir/usr/share/man/mann
  install -m755 src/$pkgname.so $pkgdir/usr/lib/$pkgname/$pkgname.so
  install -m644 src/pkgIndex.tcl $pkgdir/usr/lib/$pkgname/pkgIndex.tcl
  install -m644 doc/$pkgname.n.gz $pkgdir/usr/share/man/mann/$pkgname.n.gz
}
md5sums=('7726c3c5358b5ec691f27fba844740f1')
