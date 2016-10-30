# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-re
pkgver=1.7.1
pkgrel=1
pkgdesc="Pure OCaml regular expressions, with support for Perl and POSIX-style strings"
arch=('i686' 'x86_64')
depends=('ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib')
url="https://github.com/ocaml/ocaml-re"
license=('LGPL')
options=('!strip')
source=("https://github.com/ocaml/ocaml-re/archive/${pkgver}.tar.gz")
sha256sums=('eb18382d63459b0a4065315ce6fef854bc99152aec2b557bb8a43e664e6679e8')

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
