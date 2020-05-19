# Maintainer: Mort Yao <soi@mort.ninja>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Sergey Plaksin <serp256@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ocaml-menhir
pkgver=20200211
pkgrel=1
pkgdesc="Menhir is a LR(1) parser generator for the OCaml."
arch=("i686" "x86_64")
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('GPL' 'QPL')
depends=('ocaml>=4.02')
makedepends=('ocamlbuild' 'ocaml-findlib' 'dune')
options=(!strip !makeflags)
source=("https://gitlab.inria.fr/fpottier/menhir/-/archive/20200211/menhir-${pkgver}.tar.gz")

sha256sums=('00f677401a92d91568a4faffb4977ab71a32a265de59e35419ad5b705d4a532d')

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

  dune build
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  dune install --prefix "${pkgdir}/usr" \
  --libdir "${pkgdir}$(ocamlfind printconf destdir)"

}
