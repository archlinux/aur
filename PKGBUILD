# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5
pkgver=6.14
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml.'
conflicts=('camlp5-transitional')
url='http://camlp5.gforge.inria.fr/'
license=('BSD')
depends=('ocaml')
sha1sums=('2cde94fc53195f9acb39592a9a74d4f36114df38')
source=("http://camlp5.gforge.inria.fr/distrib/src/camlp5-$pkgver.tgz")
options=('staticlibs')

build() {
  cd ${srcdir}/camlp5-$pkgver

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -strict

  make world.opt
}

package() {
  cd camlp5-$pkgver

  make DESTDIR=${pkgdir} install

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/camlp5/LICENSE
}

