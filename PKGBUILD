# Maintainer: Mort Yao <soi@mort.ninja>
pkgname=smltojs
pkgver=4.3.7
pkgrel=1
pkgdesc="SML to JavaScript compiler"
arch=('i686' 'x86_64')
url="http://www.smlserver.org/smltojs/"
depends=('mlton' 'svn')
source=()
md5sums=()
license=('GPL')

build() {
  svn co https://svn.code.sf.net/p/mlkit/code/tags/smltojs-$pkgver $srcdir/smltojs
  cd $srcdir/smltojs
  ./autobuild
  ./configure --prefix=/usr
  make smltojs
  make smltojs_basislibs
}

package() {
  cd $srcdir/smltojs
  DESTDIR="$pkgdir" make install_smltojs install_smltojs_basislibs
}
