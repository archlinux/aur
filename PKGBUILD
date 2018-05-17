# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_tools_versioned
pkgver=5.1
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools (with ocaml-migrate-parsetree support)"
arch=('x86_64')
license=('MIT')
url="https://github.com/ocaml-ppx/ppx_tools_versioned"
depends=('ocaml' 'ocaml-findlib' 'ocaml-migrate-parsetree')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppx_tools_versioned/archive/${pkgver}.tar.gz")
md5sums=('e48cc87d6da6c2f3020fd8dfe8fe50de')

build() {
  cd "${srcdir}/ppx_tools_versioned-${pkgver}"

  make
}

package() {
  cd "${srcdir}/ppx_tools_versioned-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}"
  make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
