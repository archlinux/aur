# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-charinfo_width
pkgver=1.1.0
_changeset=6a2ed28ba68c
pkgrel=1
pkgdesc="Determine column width for a character"
arch=('x86_64')
license=('MIT')
url="https://bitbucket.org/zandoye/charinfo_width"
depends=('ocaml' 'ocaml-result' 'ocaml-camomile')
makedepends=('dune')
source=("https://bitbucket.org/zandoye/charinfo_width/get/${pkgver}.tar.gz")
sha512sums=('0d04b8b3a29c024b8784cd3d0c81c602a58883cdca152814002afda857f1582f5e9c11d246180543fd0b7bf450b8f27c8d50cedd58af1495d016c105dd05698b')

build() {
  cd "${srcdir}/zandoye-charinfo_width-${_changeset}"

  dune build --profile release
}

package() {
  cd "${srcdir}/zandoye-charinfo_width-${_changeset}"

  dune install --destdir "${pkgdir}"
  install -dm755 "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
