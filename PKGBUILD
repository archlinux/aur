# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname=zimpl
pkgver=3.3.2
pkgrel=1
pkgdesc="Mathematical modelling language for LP and MIP"
arch=(i686 x86_64)
url="http://zimpl.zib.de/"
license=('GPL')
depends=(gmp zlib)
makedepends=()
optdepends=(glpk)
source=(http://zimpl.zib.de/download/$pkgname-$pkgver.tgz)
md5sums=('e891a3d637b22fb3d8259b7c97891071')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  cp bin/$pkgname $pkgdir/usr/bin/$pkgname

  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cp doc/$pkgname.pdf $pkgdir/usr/share/doc/$pkgname
  cp -r example $pkgdir/usr/share/doc/$pkgname/example
}
