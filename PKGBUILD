# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=1.2.0
_pkgvercode=37903 # Update when bumping release
pkgrel=1
pkgdesc='A platform for deductive program verification'
arch=('x86_64')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'ocaml-num' 'ocaml-zarith' 'ocaml-zip' 'coq' 'isabelle')
source=("https://gforge.inria.fr/frs/download.php/file/${_pkgvercode}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('888c09fbad8d5c83b3c23ebc8d89fcb9c535cc3ee2cb8c3752329c086500e077')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
