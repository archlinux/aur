# Contributor: Henrik Nymann Jensen <h@henriknj.dk>

pkgname=revoco
pkgver=0.6
pkgrel=2
pkgdesc="Change the wheel behaviour of Logitech's MX-Revolution mouse."
arch=('i686' 'x86_64')
url="https://github.com/sebastien/revoco"
license=()
conflicts=('revoco2')
source=(http://downloads.sourceforge.net/project/revoco/$pkgname-$pkgver.tar.bz2
query-fix.patch)
md5sums=('97da18a988893a03098bfea6f2525686'
         '0699b052b8e555e937e465f588f7300f')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../query-fix.patch
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 revoco $pkgdir/usr/bin/revoco
}
