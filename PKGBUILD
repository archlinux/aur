# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-eqaf
pkgdesc='Constant time equal function to avoid timing attacks in OCaml'
pkgver=0.10
pkgrel=1
arch=(x86_64)
url=https://github.com/mirage/eqaf
license=(MIT)
depends=(ocaml-cstruct)
makedepends=(dune ocaml-findlib)
source=("$url/releases/download/v$pkgver/eqaf-$pkgver.tbz")
sha256sums=('67d1369c57c4d2d14a10d02632d45e355224abeb98aec08979c0bae5843092ee')

build() {
	cd "eqaf-$pkgver"
	dune build --verbose -p eqaf,eqaf-cstruct
}

package() {
	cd "eqaf-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
}
