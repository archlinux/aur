# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=1.3.1
_pkgvercode=38291 # Update when bumping release
pkgrel=1
pkgdesc='A platform for deductive program verification'
arch=('x86_64')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2' 'ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'ocaml-num' 'ocaml-zarith' 'ocaml-zip' 'coq' 'isabelle')
source=("https://gforge.inria.fr/frs/download.php/file/${_pkgvercode}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7b0d5e8f67aa3e964b44fe943cc7ea538a9ebef823713eda1b52fc0f0ccbec9b')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
