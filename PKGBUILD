# Contributor: tyr0 <thomas.hoernes@gmx.at>
# Maintainer: Daniel YC Lin <dlin.tw at gmail>
pkgname=xxdiff
pkgver=4.0
pkgrel=2
pkgdesc="A graphical browser for file and directory differences."
url="http://furius.ca/xxdiff"
license=('GPL2')
depends=('qt4')
#makedepends=('flex>=2.5.31' 'bison')
makedepends=('flex>=2.5.31' 'bison27')
arch=('x86_64' 'i686')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
build() {
  cd "$pkgname-$pkgver/src"
  export QMAKE=/usr/bin/qmake-qt4
  make -f Makefile.bootstrap
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m 755 "bin/xxdiff" "$pkgdir/usr/bin/xxdiff"
}
md5sums=('4025fe852ea408adbfa70ec77d09efc9')
