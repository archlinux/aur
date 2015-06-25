# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq-nox
pkgver=8.4pl6
pkgrel=1
pkgdesc='Formal proof management system. Headless version, without CoqIDE.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('ocaml' 'camlp5-transitional')
provides=('coq')
conflicts=('coq')
optdepends=('coq-doc')
source=("http://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
md5sums=('2334a98b64578cb81d2b4127e327b368')
sha1sums=('c89525295659a805661ef91da24ecfb94e226953')
sha256sums=('a540a231a9970a49353ca039f3544616ff86a208966ab1c593779ae13c91ebd6')

build() {
  cd "coq-$pkgver"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -opt \
    -with-doc no \
    -coqide no \
    -usecamlp5

  make world
}

package() {
  cd "coq-$pkgver"

  make COQINSTALLPREFIX="$pkgdir" install
}
