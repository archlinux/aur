# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Chlorine
pkgver=20180501
pkgrel=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml' 'ocaml-ocamlgraph' 'ocaml-findlib' 'ocaml-num')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${_codename}-${pkgver}.tar.gz")
md5sums=('2d61aa200ded2dd360a8310c9a03ac50')
sha1sums=('18281a6b9022bf1009e0f09513b289baa8b447ef')
sha256sums=('6ff8160f4800e007fb00b1b3f91dc72a97cbb3ee154a0e71181b6e5bad33883a')

build() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  make DESTDIR="$pkgdir" install
}

