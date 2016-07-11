# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: acieroid
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq
pkgver=8.5pl2
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
md5sums=('adb68bbce7616edc4e770b6962016da3')
sha1sums=('8b5699f956afb3071a84318f24333f045f7af3d4')
sha256sums=('83239d1251bf6c54a9ca5045d738e469019b93ca601756bf982aab0654e4de73')

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
