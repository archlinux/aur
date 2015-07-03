# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: charlesthehawk -- yahoo -- com
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

_pkgname=xmlm
pkgname=ocaml-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="OCaml xml manipulation module"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/xmlm/"
license=('BSD')
depends=('ocaml')
makedepends=('opam')
options=('!strip' 'staticlibs')
source=(http://erratique.ch/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tbz)
md5sums=('7e6d3363c2395d84274f1b480e4b6003')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  pkg/build true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  opam-installer --prefix=$pkgdir/usr \
    --libdir=$pkgdir$(ocamlc -where) \
    --docdir=$pkgdir/usr/share/doc
}

# vim:set ts=2 sw=2 et:

