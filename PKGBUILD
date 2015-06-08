# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=teximpatient  
pkgver=2.3
pkgrel=2
pkgdesc="TeX for the Impatient is a ~350 page book on TeX, plain TeX, and Eplain, written by Paul Abrahams, Kathryn Hargreaves, and Karl Berry. "
url="http://savannah.gnu.org/projects/teximpatient/"
arch=('any')
license=('FDL1.3')
makedepends=('texlive-core' 'icon')
source=("http://mirror.netcologne.de/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f4f6cdc433ba16bccd8bc0c5fe5d4869')

build() {
  cd $srcdir/
  touch install.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/
  make DESTDIR=$pkgdir install  
}
