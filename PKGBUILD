# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-vorbis
pkgver=0.8.0
pkgrel=1
pkgdesc="OCaml bindings to lbvorbis"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-vorbis"
license=('GPL2')
depends=('ocaml' 'libvorbis' 'ocaml-ogg')
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

sha256sums=('a7b43889d4a1dbcbe56e399e88b2e34eaba0db171abad80f90b297f20b1ed7e3')
