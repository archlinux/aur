# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: acieroid
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq
pkgver=8.5
pkgrel=2
pkgdesc='Formal proof management system. Full version that includes CoqIDE.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('gtk2' 'ocaml' 'camlp4' 'gtksourceview2')
makedepends=('ocaml-findlib' 'lablgtk2')
optdepends=('coq-doc')
source=("http://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
md5sums=('bf17135c0bb3f50a65114aec1d80e20b')
sha1sums=('0a0d124b1869d7e20cfcf3f71f086488c146f883')
sha256sums=('89a92fb8b91e7cb0797d41c87cd13e4b63bee76c32a6dcc3d7c8055ca6a9ae3d')

build() {
  cd "$srcdir/coq-$pkgver"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -coqide opt \
    -with-doc no \
    -usecamlp4

  make world
}

package() {
  cd "$srcdir/coq-$pkgver"

  make COQINSTALLPREFIX="$pkgdir" install
}
