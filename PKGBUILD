# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-jingoo
pkgdesc='OCaml template engine almost compatible with jinja2'
pkgver=1.5.2
pkgrel=1
arch=(x86_64)
url=https://github.com/tategakibunko/jingoo
license=(MIT)
depends=(ocaml-uucp)
makedepends=(dune ocaml-findlib ocaml-menhir ocaml-ppx_deriving)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('98d7be2166d1bc0615f7b4592cf68842a86df0f7b0d98d949972317f23edd34c')

build() {
	cd "jingoo-$pkgver"
	dune build --verbose -p jingoo
}

package() {
	cd "jingoo-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)" jingoo
}
