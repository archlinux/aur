# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional
_relversion=701
pkgver=7.01
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=('camlp5')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml')
sha1sums=('eff833fe21fc0e4d5c70b22635437b3785799d4b')
sha256sums=('c83640ffabc5506d7b9c9fdcc342062dee1eabd90de547c0471faf5ef5560540')
sha512sums=('9930957f707d9d2c8903f87f5f3444f71bad3d84c944436c7abc6de19209595c974098cd60a6a391f8ae87c4fb53b5122cba8e42e34fcf46d798dbdc28840008')
source=("https://github.com/camlp5/camlp5/archive/rel${_relversion}.tar.gz")
options=('staticlibs')

build() {
  cd camlp5-rel${_relversion}

  cd ${srcdir}/camlp5-rel${_relversion}

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -transitional

  make world.opt
}

package() {
  cd camlp5-rel${_relversion}

  make DESTDIR=${pkgdir} install

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/camlp5/LICENSE
}



