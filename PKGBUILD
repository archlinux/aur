# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-zed
pkgver=2.0.5
pkgrel=1
pkgdesc="An abstract engine for text editing"
arch=('i686' 'x86_64')
url='https://github.com/diml/zed'
license=('BSD')
depends=('glibc' 'ocaml' 'ocaml-camomile' 'ocaml-react' 'ocaml-charinfo_width')
makedepends=('dune')
options=('!strip')
source=("zed-${pkgver}.tar.gz::https://github.com/diml/zed/archive/${pkgver}.tar.gz")
sha512sums=('64b47b80dcea4d8016ce0203684511f0be9ac3adb8393e0755d847483690c6a56b2147ca217e9419de715a8513a59b821767969ceab418f11bcf30273b62724b')

build() {
  cd "${srcdir}/zed-${pkgver}"

  dune build -p zed
}


package() {
  cd "${srcdir}/zed-${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
