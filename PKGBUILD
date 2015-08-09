# Maintainer: Austin Adams <aur@austinjadams.com>
_pkgname=nsdo
pkgname=$_pkgname-git
pkgver=1
pkgrel=1
pkgdesc="run a command under a network namespace"
arch=('x86_64' 'i686')
url="https://github.com/ausbin/nsdo"
license=('MIT')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/ausbin/nsdo.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
