# Maintainer: Mort Yao <soi@mort.ninja>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Sergey Plaksin <serp256@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ocaml-menhir
pkgver=20200624
pkgrel=1
pkgdesc="Menhir is a LR(1) parser generator for the OCaml."
arch=("i686" "x86_64")
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('GPL' 'QPL')
depends=('ocaml>=4.02')
makedepends=('ocamlbuild' 'ocaml-findlib' 'dune')
options=(!strip !makeflags)
source=("https://gitlab.inria.fr/fpottier/menhir/-/archive/20200211/menhir-${pkgver}.tar.gz")

sha256sums=('c889226bfff56a0b29f03237764acc8c76521736c381e7810d6b55f004079ad6')

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

  dune build
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  dune install --prefix "${pkgdir}/usr" \
  --libdir "${pkgdir}$(ocamlfind printconf destdir)"

}
