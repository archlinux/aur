# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-duppy
pkgver=0.9.4
pkgrel=1
pkgdesc="OCaml asynchronous scheduler and monad for server-oriented programming"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-duppy"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-pcre')
makedepends=('ocaml-findlib' 'dune')
options=('!strip')
source=("https://github.com/savonet/ocaml-duppy/archive/v${pkgver}.tar.gz")

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

sha256sums=('b10f5b61495f934996c3f5ac7b01f2e4ea1b31e3418adb7c3fed4edc32a42686')
