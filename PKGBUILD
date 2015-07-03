# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: serp <serp 256 at gmail dot com>

_pkgname=react
pkgname=ocaml-${_pkgname}
pkgver=1.2.0
pkgrel=2
pkgdesc="An OCaml module for functional reactive programming"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/react"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib' 'opam')
source=(http://erratique.ch/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tbz)
md5sums=('f071a1308b6cad131c55cda8677823c3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  ocaml pkg/build.ml native=true native-dynlink=true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  opam-installer --prefix=${pkgdir}/usr \
    --libdir=${pkgdir}$(ocamlc -where) \
    --docdir=${pkgdir}/usr/share/doc
}
