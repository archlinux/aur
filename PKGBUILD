# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-cmdliner
pkgver=1.0.4
pkgrel=1
pkgdesc="An OCaml module for declarative definition of command line interfaces"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/cmdliner"
license=('BSD')
depends=('ocaml')
source=("http://erratique.ch/software/cmdliner/releases/cmdliner-${pkgver}.tbz")
sha512sums=('4cd1cc0932b8bbd607160cc9816b35c12a68a358a35ffcb6827f547052dc517e871a91ddbaed0447cb1fa5fdf510cdf5d760e8e5c1e4548f82e1d523e2b3ecb3')

build() {
  cd "${srcdir}/cmdliner-${pkgver}"

  make
}

package() {
  cd "${srcdir}/cmdliner-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
