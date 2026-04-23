# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-odate
pkgdesc='Date and duration library for OCaml'
pkgver=0.7
pkgrel=1
arch=(x86_64)
url=https://github.com/hhugo/odate
license=(MIT)
depends=(ocaml)
makedepends=(dune ocaml-findlib ocaml-menhir)
source=("$url/releases/download/$pkgver/odate-$pkgver.tbz")
sha256sums=('74192cc81d97f3c2689b6f5b55ef5006f71412cc947441832260ea85518f55af')

build() {
	cd "odate-$pkgver"
	dune build --verbose -p odate
}

package() {
	cd "odate-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)" odate
}
