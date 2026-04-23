# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-cmarkit
pkgdesc='OCaml libary for parsing the CommonMark specification'
pkgver=0.4.0
pkgrel=1
url=https://erratique.ch/software/cmarkit
arch=(x86_64)
license=(ISC)
depends=(ocaml)
makedepends=(ocaml-cmdliner ocaml-findlib ocaml-topkg ocamlbuild opam)
source=("$pkgname-$pkgver.tar.bz2::$url/releases/cmarkit-$pkgver.tbz")
sha256sums=('d790b56985e9e4905751e6f529ab4f5e986cfe20475d2899dad80ef0555ffe37')

build() {
	cd "cmarkit-$pkgver"
	ocaml pkg/pkg.ml build --dev-pkg false
}

package() {
	cd "cmarkit-$pkgver"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'
}
