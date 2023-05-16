# Maintainer: robertfoster
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-flac
pkgver=0.4.0
pkgrel=1
pkgdesc="OCaml bindings to libFLAC"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-flac"
license=('GPL')
depends=('ocaml' 'flac' 'ocaml-ogg')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf examples
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"
  
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('c9f87cef047b68d0871826998fc5516719e03712717c10cffa1ac4d3dae438ca')
