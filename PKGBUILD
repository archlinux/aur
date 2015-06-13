# Maintainer: Thaodan <theodorstormgrade@gmai.com>
_pkgname=libsh
pkgname=$_pkgname-git
pkgver=215b1ab
pkgrel=1
pkgdesc="shell script with some usefull functions"
url='https://github.com/Thaodan/libsh'
arch=('any')
license=('GPL2')
provides=($_pkgname)
depends=('sh' 'bash' 'coreutils' 'sed' )
source=(git+https://github.com/Thaodan/$_pkgname)
makedepends=('shpp')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD
}

build() {
  cd $srcdir/$_pkgname/src
  make PREFIX=/usr
}	
package() {
  cd $srcdir/$_pkgname/src
  make PREFIX=$pkgdir/usr install
}
md5sums=('SKIP')
