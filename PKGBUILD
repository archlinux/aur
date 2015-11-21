# Maintainer: Mario Galic <mario@libretronix.com>
pkgname=coqide-beta
pkgver=8.5beta3
pkgrel=1
pkgdesc='Interactive Theorem Proving and Program Development. Beta version.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('LGPL 2.1')
options=('!emptydirs')
depends=('gtk2' 'ocaml' 'camlp5-transitional' 'gtksourceview2')
makedepends=('ocaml-findlib' 'lablgtk2')
source=("http://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
sha1sums=('96e22c608bd1962f5aa975f5e4e8bdf28f1ef052')

build() {
  cd "$srcdir/coq-$pkgver"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -coqide opt \
    -usecamlp5 \
    -with-doc no

  make world
}

package() {
  cd "$srcdir/coq-$pkgver"

  make COQINSTALLPREFIX="$pkgdir" install
}
