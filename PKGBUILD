# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional
_relversion=710
pkgver=7.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=('camlp5')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml' 'ocaml-compiler-libs')
sha1sums=('df8c19760ca24aa22b7093d9af21b86adcf94113')
sha256sums=('83dff83d33ee9b70cd1b9d8d365db63a118201e5feb6aab49d9d3b1d62621784')
sha512sums=('faa9e88f56477162038fc80429d5839c93b3e38aec90366730babe737e2e6bb260dc39975947a6601212cc0c68f465bdbccb6337da23c07181909dfb11cf8640')
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
