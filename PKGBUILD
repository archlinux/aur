# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq-nox
pkgver=8.5
pkgrel=1
pkgdesc='Formal proof management system. Headless version, without CoqIDE.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('ocaml')
provides=('coq')
conflicts=('coq')
optdepends=('coq-doc')
source=("http://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
md5sums=('bf17135c0bb3f50a65114aec1d80e20b')
sha1sums=('0a0d124b1869d7e20cfcf3f71f086488c146f883')
sha256sums=('89a92fb8b91e7cb0797d41c87cd13e4b63bee76c32a6dcc3d7c8055ca6a9ae3d')

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
