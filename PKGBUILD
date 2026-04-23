# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-digestif
pkgdesc='Hash algorithms in C and OCaml'
pkgver=1.3.0
pkgrel=1
arch=(x86_64)
url=https://github.com/mirage/digestif
license=(MIT)
depends=(ocaml-eqaf)
makedepends=(dune ocaml-findlib)
source=("$url/releases/download/v$pkgver/digestif-$pkgver.tbz")
sha256sums=('9a6cdcb332539c87f4723fc3bd73626b2675a7b1161fdf0fed309186ce18f427')

build() {
	cd "digestif-$pkgver"
	dune build --verbose -p digestif
}

package() {
	cd "digestif-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
}
