# Maintainer: Brent Carmer <bcarmer@gmail.com>
_pkgname=abc
pkgname=$_pkgname-hg

pkgver=r3088.7cc77dc226de
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

pkgrel=1
pkgdesc="System for Sequential Logic Synthesis and Formal Verification"
url="http://www.eecs.berkeley.edu/~alanmi/abc/abc.htm"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('mercurial' 'make' 'gcc')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('abc')
provides=('abc')
md5sums=('SKIP')

source=('hg+https://hg@bitbucket.org/alanmi/abc')

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/$_pkgname
  cp abc $pkgdir/usr/bin
}
