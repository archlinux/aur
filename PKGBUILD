# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-lua-ml
pkgdesc='Embeddable Lua 2.5 interpreter implemented in OCaml'
pkgver=0.9.4
pkgrel=1
url=https://github.com/lindig/lua-ml
arch=(x86_64)
license=(BSD-2-Clause)
depends=(ocaml)
makedepends=(dune)
source=("lua-ml-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4d5512f5be2b59946ebb8e62f78954daf9bcf4284da9d6ade52df7baa314467d')

build() {
	cd "lua-ml-$pkgver"
	dune build -p lua-ml
}

package() {
	cd "lua-ml-$pkgver"
	DESTDIR="$pkgdir" dune install --prefix /usr --libdir /usr/lib/ocaml --docdir /usr/share/doc
}
