# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lo
pkgver=0.2.0
pkgrel=1
pkgdesc="OCaml bindings for LO library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lo"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'liblo')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('c8e11170e0f44ba096be0f19e7e78827f2fbb9cdb030fa0fdb88bc24bb9e1051')
