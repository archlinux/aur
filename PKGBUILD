# Maintainer: Oliver Bandel < oliver _at_ first . in - berlin . de >
# orig Contributor: Denis Wernert <denis@wernert.info>
pkgname=ocaml-csv
pkgver=1.3.4
pkgrel=2
pkgdesc="OCaml CSV parsing library"
arch=('i686' 'x86_64')
url="https://github.com/Chris00/ocaml-csv"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib')
builddepends=('ocaml')
source=(https://github.com/Chris00/ocaml-csv/releases/download/1.3.3/csv-$pkgver.tar.gz)
md5sums=('a84556e6c7b86961b4e9fb7519fce9fd')
options=(!libtool !strip zipman)

build() {
  cd csv-$pkgver
  sed -i s@/usr/local@$pkgdir/usr@g setup.ml
  make
}

package() {
  cd csv-$pkgver
  SITE=$pkgdir`ocamlc -where`/site-lib
  install -d $SITE -m 755
  OCAMLFIND_DESTDIR=$SITE make install
}

# vim:set ts=2 sw=2 et:
