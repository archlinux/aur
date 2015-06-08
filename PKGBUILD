# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=tkgate
pkgver=1.8.7
pkgrel=4
pkgdesc="A digital circuit simulator with a tcl/tk-based graphical editor"
arch=('i686' 'x86_64')
url="http://www.tkgate.org"
license=("GPL")
makedepends=('imake')
depends=('tcl' 'tk')
conflicts=('tkgate-beta')
source=("http://www.tkgate.org/downloads/$pkgname-$pkgver.tgz"
        tkgate.diff.gz)
md5sums=('628b5ca66283fc1473c9ef7300ae73c8'
         '0eaafa98ff751c657b3adf73ea4f5bf6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  zcat ../tkgate.diff.gz | patch -p1
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
}
