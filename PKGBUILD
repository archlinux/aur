# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=loggedfs
pkgname=$_pkgname-git
pkgver=0.9.r7.g24b0afb
pkgrel=1
pkgdesc="Filesystem monitoring with Fuse"
arch=('i686' 'x86_64')
url="https://rflament.github.io/loggedfs/"
license=('Apache')
depends=('fuse3')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/rflament/loggedfs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/loggedfs.//g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}

