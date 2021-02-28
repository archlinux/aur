# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-soundtouch
pkgver=0.1.9
pkgrel=1
pkgdesc="OCaml bindings for the soundtouch audio library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-soundtouch"
license=('LGPL2.1')
depends=('ocaml' 'soundtouch')
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

sha256sums=('53fff10a6a509bc0d08e240117d03594217403f7cc45ebfd4077ade551980485')
