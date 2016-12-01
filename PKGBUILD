# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq-nox
pkgver=8.5pl3
pkgrel=1
pkgdesc='Formal proof management system. Headless version, without CoqIDE.'
arch=('i686' 'x86_64')
url='https://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('ocaml' 'camlp4')
provides=('coq')
conflicts=('coq')
optdepends=('coq-doc')
source=("https://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
md5sums=('b1295e3ec6e27e301c1cb33de537b77d')
sha1sums=('daecdf067520ad031711a5839e4251f921cb83d6')
sha256sums=('305b92e05d406d4d0c64f43d4fadb6b89419120a1d4ae4115ed1c5eb8812d33b')

build() {
  cd "coq-$pkgver"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -with-doc no \
    -coqide no \
    -usecamlp4

  make world
}

package() {
  cd "coq-$pkgver"

  make COQINSTALLPREFIX="$pkgdir" install
}
