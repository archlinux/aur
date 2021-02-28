# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ao
pkgver=0.2.3
pkgrel=2
pkgdesc="OCaml libao bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ao"
license=('LGPL2.1')
depends=('ocaml' 'libao')
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

sha256sums=('188f781ef31497444475ced4632ebe44e3d80ddc5717f1f6cd8e1080a43c0851')
