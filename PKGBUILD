# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: acieroid
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq
pkgver=8.5pl1
pkgrel=1
pkgdesc='Formal proof management system. Full version that includes CoqIDE.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('gtk2' 'ocaml' 'camlp4' 'gtksourceview2')
makedepends=('ocaml-findlib' 'lablgtk2')
optdepends=('coq-doc')
source=("http://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
md5sums=('1faa8a237c3e81905dc938b6b727b807')
sha1sums=('92722ffc2be6948e0074b211bb556ad4b911ebd6')
sha256sums=('4bfa75b10ae1be61301d0f7bc087b7c24e0b8bd025dd358c75709ac04ddd5df0')

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
