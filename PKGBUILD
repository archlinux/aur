# Maintainer: éclairevoyant

_pkgname=astring
pkgname="ocaml-$_pkgname"
pkgver=0.8.5
pkgrel=1
license=('ISC')
arch=('x86_64')
pkgdesc="Alternative String module for OCaml"
url="https://erratique.ch/software/$_pkgname"
depends=('ocaml>=4.05.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam')
source=("$url/releases/$_pkgname-$pkgver.tbz")
options=('!strip')
md5sums=('e148907c24157d1df43bec89b58b3ec8')

build() {
	cd $_pkgname-$pkgver
	ocaml pkg/pkg.ml build
}

package() {
	cd $_pkgname-$pkgver
	opam-installer --prefix "$pkgdir/usr" --libdir 'lib/ocaml' --docdir 'share/doc'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/share/doc/$pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}
