# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-re
pkgver=1.6.1
pkgrel=1
pkgdesc="Pure OCaml regular expressions, with support for Perl and POSIX-style strings"
arch=('i686' 'x86_64')
depends=('ocaml')
makedepends=('ocaml-findlib')
url="https://github.com/ocaml/ocaml-re"
license=('LGPL')
options=('!strip')
source=("https://github.com/ocaml/ocaml-re/archive/${pkgver}.tar.gz")
sha256sums=('4fe88b095bb65abc3e9b132bdd6fba7451eb3a32f1a5cd6a0f9a92faca099f47')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix /usr
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
}
