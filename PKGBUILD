pkgname=ocaml-csv
pkgver=2.3
pkgrel=1
pkgdesc="OCaml CSV parsing library"
arch=('i686' 'x86_64')
url="https://github.com/Chris00/ocaml-csv"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib' 'ocamlbuild' 'ocaml-lwt' 'opam' 'ocaml-uutf')
source=(https://github.com/Chris00/ocaml-csv/archive/$pkgver.tar.gz)
md5sums=('1d2e565c0f7214254efe3dfde566c048')
sha256sums=('e795287c086997ab3ca57e3d8e0c2fdbf6d5c977bef54249943432f1c932ad81')
options=(!libtool !strip zipman)

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
}

# vim:set ts=2 sw=2 et:
