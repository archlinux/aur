# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Argon
pkgver=18.0
pkgrel=1
epoch=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'ocaml-zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml' 'ocaml-ocamlgraph' 'ocaml-findlib' 'ocaml-num')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${pkgver}-${_codename}.tar.gz")
md5sums=('659cf094d6e92a8adeb5863ec229020b')
sha1sums=('b97529a6f92622f9d6e9132668b978e615c1969e')
sha256sums=('42b12540c608f3bf6cc258a6bcededf3c596589e58bfdfc6bf473a05ab980829')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_codename"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_codename"
  make DESTDIR="$pkgdir" install
}

