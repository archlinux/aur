# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-spelll
pkgdesc='Fuzzy string searching, using Levenshtein automaton'
pkgver=0.4
pkgrel=1
arch=(x86_64)
url=https://github.com/c-cube/spelll
license=(MIT)
depends=(ocaml-stdlib-shims ocaml-seq)
makedepends=(dune ocaml-findlib)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8505685172b90b2ddd013b22223c410a3c234050db002000fdad08aaa435b1b')

build() {
	cd "spelll-$pkgver"
	dune build --verbose -p spelll
}

package() {
	cd "spelll-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)" spelll
}
