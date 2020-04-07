# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
_pkgname=dumb-init
pkgname=$_pkgname-git
pkgver=1.2.2
pkgrel=1
pkgdesc="A minimal init system for Linux containers"
arch=('x86_64')
url="https://github.com/Yelp/dumb-init"
license=('MIT')
provides=('dumb-init')
makedepends=('git')
source=("git+https://github.com/Yelp/dumb-init.git")
sha1sums=('SKIP')

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname
  install -m755 -D $_pkgname $pkgdir/usr/bin/$_pkgname
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
