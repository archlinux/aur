# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-frei0r
pkgver=0.1.2
pkgrel=1
pkgdesc="OCaml bindings to the frei0r video API"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-frei0r"
license=('LGPL2.1')
depends=('ocaml' 'frei0r-plugins')
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

sha256sums=('f6c22e7c9426cfadd1f20f9ee7970b1b5b7546588a872f89f8d8296f7e7bcb08')
