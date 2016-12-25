# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>
# Contributor: Tej Chajed <tchajed at mit dot edu>

pkgname=camlp5
pkgver=6.17
_relname=rel617
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml.'
conflicts=('camlp5-transitional')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml')
source=("https://github.com/camlp5/camlp5/archive/$_relname.tar.gz")
options=('staticlibs')
sha1sums=('cfe65be4bb6334ffad742a3060a6fee7bb0b5bf3')

build() {
  cd ${srcdir}/camlp5-$_relname

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -strict

  make world.opt
}

package() {
  cd camlp5-$_relname

  make DESTDIR=${pkgdir} install

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/camlp5/LICENSE
}

