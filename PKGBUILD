# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=0.88.3
_pkgvercode=37313 # Update when bumping release
pkgrel=1
pkgdesc='A platform for deductive program verification'
arch=('x86_64')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'zarith' 'coq' 'isabelle')
source=(https://gforge.inria.fr/frs/download.php/file/$_pkgvercode/$pkgname-$pkgver.tar.gz)
sha256sums=('3e6afd141800dce4d722794378e3eb8a9a05a06f8e51d520ff72159a3c6e3552')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
