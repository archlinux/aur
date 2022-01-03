# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=libredwg-git
_pkgname=libredwg
pkgver=latest
pkgrel=2
pkgdesc="A free C library to handle DWG files"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libredwg/"
license=('GPL')
makedepends=('git')
source=("$_pkgname::git+https://git.savannah.gnu.org/git/$_pkgname.git")
md5sums=('SKIP')

build() {
  cd "$_pkgname"

  sh autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
