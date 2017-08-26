# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>
# Contributor: Tej Chajed <tchajed at mit dot edu>

pkgname=camlp5
pkgver=7.01
_relname=rel701
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml.'
conflicts=('camlp5-transitional')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml')
source=("https://github.com/camlp5/camlp5/archive/$_relname.tar.gz")
options=('staticlibs')
sha1sums=('eff833fe21fc0e4d5c70b22635437b3785799d4b')

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

