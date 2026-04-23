# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-stdlib-random
pkgdesc='Compatibility library for Random number generation'
pkgver=1.2.0
pkgrel=1
arch=(x86_64)
url=https://github.com/ocaml/stdlib-random
license=(LGPL-2.1-only)
depends=(ocaml)
makedepends=(cppo dune ocaml-findlib)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b479958eb83bab2d3e1c4ea1054e2d963b6adf2a1e671706e9130e617a5dcb03')

build() {
	cd "stdlib-random-$pkgver"
	dune build -p stdlib-random
}

package() {
	cd "stdlib-random-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
}
