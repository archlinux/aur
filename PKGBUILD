# Maintainer: Thaodan <theodorstormgrade@gmai.com>
_pkgname=shpp
pkgname=$_pkgname-git
pkgver=1.9.1.1.r10.gccee40c
pkgrel=1
pkgdesc="preprocessor written for posix shell"
url="https://github.com/Thaodan/shpp"
arch=('any')
license=('GPL2')
depends=('sh' 'coreutils' 'sed' 'bc')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz")
conflicts=('sh-make-tools')
makedepends=('git' 'emacs')
source=(git+https://github.com/Thaodan/$_pkgname)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ./tools/git_revgen
}

build() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr
}	
check() {
  cd $srcdir/$_pkgname/src
  make -C tests
}

package() {
  cd $srcdir/$_pkgname
  make PREFIX=$pkgdir/usr install
}
