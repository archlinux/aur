# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional
_relversion=703
pkgver=7.03
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=('camlp5')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml')
sha1sums=('241275eb295891a2e9ac85fdcbd0eed53c4cbef6')
sha256sums=('c13d0a957a8e70627e1900ca25243b5e8da042bbda9eaa9e7d06955c0e3df21a')
sha512sums=('0c76d469c5f8c727088f3136107b6690349b50791ef8baefffdaa90141230907f977a7a886a9e8d88d39d8fa315637d882d0205c57d752e16575c888a8a1f54d')
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



