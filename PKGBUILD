# Maintainer: Willem Herremans <whpgf at scarlet dot be>
pkgname=pgintcl
pkgver=3.5.0
pkgrel=1
pkgdesc="A Tcl interface to PostgreSQL"
arch=('any')
url="http://sourceforge.net/projects/pgintcl"
license=('custom: essentially a BSD license')
groups=()
depends=('tcl>=8.4.4')
makedepends=()
optdepends=('postgresql>=8.3.0: for running a postgresql database server')
source=(http://downloads.sourceforge.net/pgintcl/$pkgver/$pkgname-$pkgver.tgz README.arch)
md5sums=('5c05d04e661d792baa121c6b5ce229b8'
         'd1a7075738c3dcb9993c2dacf3fa6695')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/lib/$pkgname
  install -d $pkgdir/usr/share/doc/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  install --mode=644 pgin.tcl pkgIndex.tcl $pkgdir/usr/lib/$pkgname
  install --mode=644 COPYING $pkgdir/usr/share/licenses/$pkgname
  install --mode=644 INTERNALS NEWS README REFERENCE $pkgdir/usr/share/doc/$pkgname
  install --mode=644 $srcdir/README.arch $pkgdir/usr/share/doc/$pkgname
}
