# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fdkaac
pkgver=0.3.2
pkgrel=1
pkgdesc="OCaml bingind for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL')
depends=('ocaml' 'libfdk-aac')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-fdkaac/archive/${pkgver}.tar.gz")
sha256sums=('0de28749e1435839ead013c385c6b963b88b57770e362e067139c2fd67a52e5f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}
