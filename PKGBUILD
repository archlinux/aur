# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fdkaac
pkgver=0.3.2
pkgrel=3
pkgdesc="OCaml bingind for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL')
depends=('ocaml' 'libfdk-aac')
makedepends=('ocaml-findlib' 'dune')
options=('!strip')
source=("https://github.com/savonet/ocaml-fdkaac/archive/${pkgver}.tar.gz")

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

sha256sums=('0de28749e1435839ead013c385c6b963b88b57770e362e067139c2fd67a52e5f')