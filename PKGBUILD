# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=0.88.1
_pkgvercode=37185 # Update when bumping release
pkgrel=1
pkgdesc='A platform for deductive program verification'
arch=('x86_64' 'i686')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'zarith' 'coq' 'isabelle')
source=(https://gforge.inria.fr/frs/download.php/file/$_pkgvercode/$pkgname-$pkgver.tar.gz)
sha256sums=('7ce28e92d67619f52eb7c61a4f37d628e7f48e882a9d2b716e1b443d4c0240e2')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
