# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lame
pkgver=0.3.4
pkgrel=2
pkgdesc="OCaml bindings to the LAME mp3 encoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lame"
license=('GPL2')
depends=('ocaml' 'lame')
makedepends=('ocaml-findlib' 'dune')
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

sha256sums=('f90b9e090b3fc27437b64dd05c15b92778f07cf4f3d82e0f8186299cb8e1102d')
