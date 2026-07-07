# Maintainer: George Anthony Nuarin <qzsong@proton.me>
# Contributor: Nicolas Geniteau <nicolas.geniteau@gmail.com>
pkgname=gcl
pkgver=2.7.2pre34
pkgrel=2
pkgdesc="GNU Common Lisp"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/gcl/"
source=("git+https://https.git.savannah.gnu.org/git/gcl.git#tag=Version_${pkgver//./_}")
sha256sums=('SKIP')

build() {
  cd $srcdir/$pkgname/$pkgname/
  #Fixes compilation on -lto enabled configs
  unset CFLAGS LDFLAGS
  ./configure --prefix=/usr
  make -j2
  make DESTDIR=build install
}

package() {
  cp -r  $srcdir/$pkgname/$pkgname/build/. $pkgdir/
}
