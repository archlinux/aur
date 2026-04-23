# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-camlp-streams
pkgdesc='The Stream and Genlex libraries for use with Camlp4 and Camlp5'
pkgver=5.0.1
pkgrel=1
url=https://github.com/ocaml/camlp-streams
arch=(x86_64)
license=(LGPL-2.1-only)
depends=(ocaml)
makedepends=(dune)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad71f62406e9bb4e7fb5d4593ede2af6c68f8b0d96f25574446e142c3eb0d9a4')

build() {
	cd "camlp-streams-$pkgver"
	dune build -p camlp-streams
}

package() {
	cd "camlp-streams-$pkgver"
	dune install --destdir="$pkgdir" --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
}
