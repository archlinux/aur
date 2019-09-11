# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-lambda-term
pkgver=2.0.2
pkgrel=1
pkgdesc='A cross-platform library for manipulating the terminal'
arch=('i686' 'x86_64')
url="https://github.com/diml/lambda-term"
license=('BSD')
depends=('ocaml' 'ocaml-lwt' 'ocaml-lwt_log' 'ocaml-react' 'ocaml-zed' 'ocaml-camomile')
makedepends=('dune')
options=('!strip')
source=("https://github.com/diml/lambda-term/releases/download/${pkgver}/lambda-term-${pkgver}.tbz")
sha512sums=('61b4f3d80a8e17562cd7efe3a15258134a41fad67db200e9bde8896e39bff63c3274f3fff54f0233441555b5119fddcbea80fbab9b82caaa0b6b4deb56843f09')

build() {
  cd "${srcdir}/lambda-term-${pkgver}"

  dune build --profile release
}


package() {
  cd "${srcdir}/lambda-term-${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
}
