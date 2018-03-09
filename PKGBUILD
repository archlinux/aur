# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Sulfur
pkgver=20171101
pkgrel=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml' 'ocaml-ocamlgraph' 'ocaml-findlib' 'ocaml-num')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${_codename}-${pkgver}.tar.gz")
md5sums=('6b3135bb8e4771f1daf6d5d4b06ec326')
sha1sums=('dd20055673b44f730ab6acea3780dd59633bd998')
sha256sums=('81cb97e895d7d698aca6bb7c9b8963f1179c503d6a78bdfc7c66e4502b7692ef')

build() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  make DESTDIR="$pkgdir" install
}

