# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional
_relversion=707
pkgver=7.07
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=('camlp5')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml' 'ocaml-compiler-libs')
sha1sums=('4880093f6fdde5edebb6a032ffb880acfbd02c61')
sha256sums=('a2c493b833b217adf94d2000eb19015b990c4e441beb35cf36b1d33ed2351991')
sha512sums=('e396c109c67383ba56f3ada43f5b5ece8b2339528553802386a1d9637a151a14d7dfc48c0a4219b24ca53fad7acfddfd4dc2c1fe109ced8b71f16202b94b8cf6')
source=("https://github.com/camlp5/camlp5/archive/rel${_relversion}.tar.gz")
options=('staticlibs')

build() {
  cd camlp5-rel${_relversion}

  cd ${srcdir}/camlp5-rel${_relversion}

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -transitional

  make -j2
}

package() {
  cd camlp5-rel${_relversion}

  make DESTDIR=${pkgdir} install

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/camlp5/LICENSE
}



