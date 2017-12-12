# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=0.88.2
_pkgvercode=37236 # Update when bumping release
pkgrel=1
pkgdesc='A platform for deductive program verification'
arch=('x86_64')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'zarith' 'coq' 'isabelle')
source=(https://gforge.inria.fr/frs/download.php/file/$_pkgvercode/$pkgname-$pkgver.tar.gz)
sha256sums=('83f2c8887aa9717d5dcc03bde16b495a93819826f7a06277adbdf2f3be33d8f8')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
