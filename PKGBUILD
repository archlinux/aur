# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=1.0.0
_pkgvercode=37604 # Update when bumping release
pkgrel=1
pkgdesc='A platform for deductive program verification'
arch=('x86_64')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'ocaml-num' 'ocaml-zarith' 'ocaml-zip' 'coq' 'isabelle')
source=("https://gforge.inria.fr/frs/download.php/file/${_pkgvercode}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b65f4c1661ac8a6240778e6fa553c46098a26d029b02e5cf0e05b0c0630300a2')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
