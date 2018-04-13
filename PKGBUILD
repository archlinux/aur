# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional
_relversion=705
pkgver=7.05
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=('camlp5')
url='https://camlp5.github.io/'
license=('BSD')
depends=('ocaml' 'ocaml-compiler-libs')
sha1sums=('5e3ed5d4597c86ddff13bb0a45dddccbffca40ed')
sha256sums=('ccc7afd2936c75cbee4aad58cd2ef8e7bf0dded556b91d76e4e462a27550ff12')
sha512sums=('fed60b71884883b78ae6db6f72230d155c364633141dfa936b5defc9701629b4c4845b61b43cfd8f0bc85467c5713f48659e5809796e181dcf02dc051d266762')
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



