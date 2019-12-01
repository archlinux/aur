# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Potassium
pkgver=19.1
pkgrel=1
epoch=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'ocaml-zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml' 'ocaml-ocamlgraph' 'ocaml-findlib' 'ocaml-num' 'ocaml-yojson')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${pkgver}-${_codename}.tar.gz")
md5sums=('439bfca103e6ceb726df3fc993334d57')
sha1sums=('ee1f2528c58196ffbefb93879eff65fbecad8db6')
sha256sums=('2def511c3cf4b0362bd67520bc48345c5093754c70de7c712b9af9b12561ba9b')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_codename"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_codename"
  make DESTDIR="$pkgdir" install
}

