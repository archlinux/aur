# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-cmdliner
pkgver=1.0.4
pkgrel=2
pkgdesc="An OCaml module for declarative definition of command line interfaces"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/cmdliner"
license=('BSD')
depends=('ocaml')
makedepends=('dune' 'ocaml-findlib')
source=("${url}/releases/cmdliner-${pkgver}.tbz")

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  dune build
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"
  
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('5c2a93d44af8a38996a2c0f80fbd7970fe4751f104be470cafa069353fc004c0')
