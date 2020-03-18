# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Calcium
pkgver=20.0
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
md5sums=('47b9a0a246ae172384dd927516ab184c')
sha1sums=('37b41710bd07a6913f617219c1a71757aebbac98')
sha256sums=('167ba128cda0974a33fbf36a5634a9f520f8cad9dbcc3ab590d4cb264cb0bb0d')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_codename"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_codename"
  make DESTDIR="$pkgdir" install
}

