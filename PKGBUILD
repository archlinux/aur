# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ao
pkgver=0.2.3
pkgrel=1
pkgdesc="OCaml libao bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ao"
license=('LGPL2.1')
depends=('ocaml' 'libao')
makedepends=('dune')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}

sha256sums=('188f781ef31497444475ced4632ebe44e3d80ddc5717f1f6cd8e1080a43c0851')
