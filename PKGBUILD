# Maintainer: Thaodan <theodorstormgrade@gmai.com>
_pkgname=shpp
pkgname=$_pkgname-git
pkgver=33439b2
pkgrel=1
pkgdesc="preprocessor written for posix shell"
url="https://github.com/Thaodan/shpp"
arch=('any')
license=('GPL2')
depends=('sh' 'coreutils' 'sed' 'bc')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz")
conflicts=('sh-make-tools')
source=(git+https://github.com/Thaodan/$_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD
}

build() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr
}	
check() {
  cd $srcdir/$_pkgname/src
  make tests
}

package() {
  cd $srcdir/$_pkgname
  make PREFIX=$pkgdir/usr install
}
md5sums=('SKIP')
