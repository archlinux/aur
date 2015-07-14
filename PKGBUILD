# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3
pkgver=0.9.8.10063
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="http://beta.visl.sdu.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools')
depends=('icu')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
options=('!libtool')
arch=('i686' 'x86_64')
source=("http://beta.visl.sdu.dk/download/vislcg3/${pkgname}-${pkgver}.tar.bz2")
md5sums=('c77f9746c41387daa6c4a5f1dca8923f')
sha256sums=('82cd9c77c18e5758cf55138ff00b3675940f33a52cde17f79c3ea963c42a07d8')
install='vislcg3.install'

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./cmake.sh -D CMAKE_INSTALL_PREFIX=/usr && make
}
