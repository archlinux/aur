# Maintainer: Mario Galic <mario@libretronix.com>
pkgname=coqide-beta
pkgver=8.5rc1
pkgrel=1
pkgdesc='Interactive Theorem Proving and Program Development. Beta version.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('LGPL 2.1')
options=('!emptydirs')
depends=('gtk2' 'ocaml' 'camlp5-transitional' 'gtksourceview2')
makedepends=('ocaml-findlib' 'lablgtk2')
source=("http://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz")
sha1sums=('4c6ec9444735d25b0ca537c8c872ecb4e71dbfd5')

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
