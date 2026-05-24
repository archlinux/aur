# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-lua-ml
pkgdesc='Embeddable Lua 2.5 interpreter implemented in OCaml'
pkgver=0.9.5
pkgrel=1
url=https://github.com/lindig/lua-ml
arch=(x86_64)
license=(BSD-2-Clause)
depends=(ocaml)
makedepends=(dune ocaml-menhir)
source=("lua-ml-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('200a89328f0f669e9397aa5c27b1e09bbd3ad5ed80b12cbb62174f820f9cca55')

build() {
	cd "lua-ml-$pkgver"
	dune build -p lua-ml
}

package() {
	cd "lua-ml-$pkgver"
	DESTDIR="$pkgdir" dune install --prefix /usr --libdir /usr/lib/ocaml --docdir /usr/share/doc
}
