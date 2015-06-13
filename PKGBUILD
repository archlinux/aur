# Maintainer: Thaodan <theodorstormgrade@gmai.com>
_pkgname=usenew
pkgname=$_pkgname-git
pkgver=e8098e6
pkgrel=1
pkgdesc="wine prefix manager with some libs around it written for POSIX shells and in some parts for bash shell"
arch=('any')
url="https://github.com/Thaodan/usenew"
license=('GPL2')
depends=('sh' 'bash' 'coreutils' 'sed' 'wine' 'libsh')
provides=($_pkgname)
source=(git+https://github.com/Thaodan/$_pkgname)
makedepends=('shpp')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD
}

build() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr
}	
package() {
  cd $srcdir/$_pkgname
  make PREFIX=$pkgdir/usr install
}
md5sums=('SKIP')
