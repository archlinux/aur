# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3
pkgver=1.5.1
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="https://edu.visl.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools' 'cmake')
depends=('icu')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GrammarSoft/cg3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9a2af99e0bb28498650753961179923e1d909d256e9489fca34847fc6181b45')
install='vislcg3.install'

package () {
  cd "$srcdir/cg3-$pkgver"
  make DESTDIR="$pkgdir/" install
}

build() {
  cd "$srcdir/cg3-$pkgver"
  ./cmake.sh -D CMAKE_INSTALL_PREFIX=/usr && make
}
