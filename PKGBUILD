# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-speex
pkgver=0.4.0
pkgrel=1
pkgdesc="OCaml bindings to libspeex"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-speex"
license=('GPL2')
depends=('ocaml' 'speex' 'ocaml-ogg')
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

sha256sums=('7cc69b5e549781cca2f4c7ec30faba313390f6dd5e3d056fd55f29ea71b9133f')
