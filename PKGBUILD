# Maintainer: Brent Carmer <bcarmer@gmail.com>
_pkgname=abc
pkgname=$_pkgname-hg

pkgver=r.
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
makedepends=('git' 'make' 'gcc')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('abc')
provides=('abc')
md5sums=('SKIP')

source=('git+https://github.com/berkeley-abc/abc.git')

build() {
    cd $srcdir/$_pkgname
    make -j
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd $srcdir/$_pkgname
    cp abc $pkgdir/usr/bin
}
