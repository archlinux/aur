pkgname=ocaml-csv
pkgver=2.4
pkgrel=1
pkgdesc="OCaml CSV parsing library"
arch=('i686' 'x86_64')
url="https://github.com/Chris00/ocaml-csv"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib' 'ocamlbuild' 'ocaml-lwt' 'opam' 'ocaml-uutf' 'dune')
source=(https://github.com/Chris00/ocaml-csv/archive/$pkgver.tar.gz)
sha256sums=('14b1173d2a64053e06571cbe4a86fa4be4b48ea190d1f0c389ce34fd9800c665')
options=(!libtool !strip zipman)

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
}

# vim:set ts=2 sw=2 et:
