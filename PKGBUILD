# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-re
pkgver=1.5.0
pkgrel=1
pkgdesc="Pure OCaml regular expressions, with support for Perl and POSIX-style strings"
arch=('i686' 'x86_64')
depends=('ocaml')
makedepends=('ocaml-findlib')
url="https://github.com/ocaml/ocaml-re"
license=('LGPL')
options=('!strip')
source=("https://github.com/ocaml/ocaml-re/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('53322f763a8d771a68f986c9c323cab7d3afa56873c3eefa528fb92b1b511dd3')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  ./configure --prefix /usr
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
}
