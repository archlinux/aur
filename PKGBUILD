# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-portaudio
pkgver=0.2.3
pkgrel=1
pkgdesc="OCaml bindings for portaudio"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-portaudio"
license=('LGPL2.1')
depends=('ocaml' 'portaudio')
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

sha256sums=('06510aa5c9930ddf5fd677d74a6cde10844e3a14ea4dca73db08bfedfb005839')
