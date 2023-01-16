# Maintainer: Nicolas Geniteau <nicolas.geniteau@gmail.com>
pkgname=gcl
pkgver=2.6.14
pkgrel=1
pkgdesc="GNU Common Lisp"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/gcl/"
source=(https://git.savannah.gnu.org/cgit/gcl.git/snapshot/gcl-Version_${pkgver//./_}.tar.gz)
sha256sums=('9765f721d354dfe4928037cd1c963ba4aab6c28345570300c1f6bf17e8cb4562')

build() {
  cd $srcdir/$pkgname-Version_${pkgver//./_}/$pkgname/
  CFLAGS="${CFLAGS} -fplt -fcf-protection=none" ./configure --prefix=/usr
  make -j1
  make DESTDIR=build install
}

package() {
  cp -r  $srcdir/$pkgname-Version_${pkgver//./_}/$pkgname/build/. $pkgdir/
}
