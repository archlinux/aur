# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3
pkgver=1.4.5
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="https://visl.sdu.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools' 'cmake')
depends=('icu')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GrammarSoft/cg3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('306b4ba85cd48d3992c44fb2e03c9614f00ae59ad3ede7730a1e499666b54706')
install='vislcg3.install'

package () {
  cd "$srcdir/cg3-$pkgver"
  make DESTDIR="$pkgdir/" install
}

build() {
  cd "$srcdir/cg3-$pkgver"
  ./cmake.sh -D CMAKE_INSTALL_PREFIX=/usr && make
}
