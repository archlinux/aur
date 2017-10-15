# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=0.88.0
_pkgvercode=37147 # Update when bumping release
pkgrel=1
pkgdesc='The next generation of the software verification platform Why'
arch=('x86_64' 'i686')
options=('!makeflags')
url='http://why3.lri.fr/'
license=('LGPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-menhir' 'rubber' 'gtksourceview2' 'lablgtk2' 'ocaml-ocamlgraph' 'zarith' 'coq' 'isabelle')
source=(https://gforge.inria.fr/frs/download.php/file/$_pkgvercode/$pkgname-$pkgver.tar.gz)
sha256sums=('523b2566aa8f2089e52d2ea78bce310a7668c1e488fca49b3272ccef1c24bda4')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-pvs-libs
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
