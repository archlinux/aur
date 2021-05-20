# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3
pkgver=1.3.2
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="https://visl.sdu.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools' 'cmake')
depends=('icu')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TinoDidriksen/cg3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce1a954f761137cad0b740c4f5e37220589cbd056b4fd69e30dd51e141d96da3')
install='vislcg3.install'

package () {
  cd "$srcdir/cg3-$pkgver"
  make DESTDIR="$pkgdir/" install
}

build() {
  cd "$srcdir/cg3-$pkgver"
  ./cmake.sh -D CMAKE_INSTALL_PREFIX=/usr && make
}
