# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=trowser
pkgver=1.3
pkgrel=3
pkgdesc="A browser for large line-oriented text files, implemented in Tcl/Tk"
arch=(any)
url="http://www.nefkom.net/tomzo/prj/trowser/"
license=('GPL3')
depends=('tk')
install=trowser.install
source=("http://www.nefkom.net/tomzo/prj/trowser/$pkgname-$pkgver.tar.gz")
md5sums=('a8dd31314f1c0026cb747d1f9cd9bf45')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  gzip $pkgname.1
  install -Dm755 $pkgname.tcl      "$pkgdir/usr/bin/$pkgname.tcl"
  install -Dm644 $pkgname.1.gz     "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
  install -Dm644 COPYING           "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README            "$pkgdir/usr/share/doc/$pkgname/README"
  cd ../..
  install -Dm644 $pkgname.desktop  "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.png      "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
