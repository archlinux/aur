# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ocaml-objsize
_pkgname=objsize
pkgver=0.18
pkgrel=1
pkgdesc="A small OCaml library for computing size of OCaml values."
arch=('i686' 'x86_64')
url="https://opam.ocaml.org/packages/objsize/"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'camlp4' 'ocamlbuild')
source=(https://ygrek.org/p/release/objsize/$_pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/gds-objsize-2e090c93ff31"
  make
}

check() {
  cd "$srcdir/gds-objsize-2e090c93ff31"
  make test
}

package() {
  cd "$srcdir/gds-objsize-2e090c93ff31"

  mkdir -p ${pkgdir}$(ocamlfind printconf destdir) 
  make install \
    DESTDIR=$pkgdir \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore
}

# vim:set ts=2 sw=2 et:
sha256sums=('6ea998f820ba3d6e261d0bb28d07c4a7ce832307ee7ef96d11cdafc0cd43caef')
