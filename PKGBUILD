# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ogg
pkgver=0.7.3
pkgrel=1
pkgdesc="OCaml binding to libogg"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ogg"
license=('LGPL2.1')
depends=('ocaml' 'libogg')
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

sha256sums=('6e5bc628c7473f52747a03294c0e3bdf449b14e120e52b6e3067a67ecbb96a4a')
