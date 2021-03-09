# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-portaudio
pkgver=0.2.2
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

sha256sums=('8968c3749c9a1f1d09bd7ceb970c068ded0eb8f6b77d9002227182c97a4a044e')
