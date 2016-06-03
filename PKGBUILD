# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3
pkgver=0.9.9.10800
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="http://beta.visl.sdu.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools' 'cmake')
depends=('icu')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
options=('!libtool')
arch=('i686' 'x86_64')
source=("http://beta.visl.sdu.dk/download/vislcg3/cg3-0.9.9~r10800.tar.bz2")
md5sums=('c6a6549cf040077949ee33ca239d3128')
sha256sums=('c85446c671fdb55dc01bf6092dd32ccb05ad4e057563d5c4293ee2409df610ba')
install='vislcg3.install'

package () {
  cd "$srcdir/cg3"
  make DESTDIR="$pkgdir/" install
}

build() {
  cd "$srcdir/cg3"
  ./cmake.sh -D CMAKE_INSTALL_PREFIX=/usr && make
}
