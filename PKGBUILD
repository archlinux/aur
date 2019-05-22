# Maintainer: Oliver Bandel < oliver _at_ first . in - berlin . de >
# orig Contributor: Denis Wernert <denis@wernert.info>
pkgname=ocaml-csv
pkgver=2.2
pkgrel=3
pkgdesc="OCaml CSV parsing library"
arch=('i686' 'x86_64')
url="https://github.com/Chris00/ocaml-csv"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib' 'ocamlbuild' 'ocaml-lwt' 'opam')
builddepends=('ocaml')
source=(https://github.com/Chris00/ocaml-csv/archive/$pkgver.tar.gz)
md5sums=('ce8f8fbf965b5a58cb3f92e98113a9ec')
sha256sums=('ba9130c8a1a360d6f58f8206470b3be24b8e9626755335e0313922dc4cdea329')
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
