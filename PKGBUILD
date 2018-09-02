# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Chlorine
pkgver=20180502
pkgrel=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'ocaml-zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml' 'ocaml-ocamlgraph' 'ocaml-findlib' 'ocaml-num')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${_codename}-${pkgver}.tar.gz")
md5sums=('5c152f0859880d48f98377de59d6328a')
sha1sums=('c2e734eeb625cd6011c80b61672c6643b05e2ed7')
sha256sums=('ecc9f5822294b76c345973858a6d8da940bae4042b394ffd3d25fd60114499d4')

build() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  make DESTDIR="$pkgdir" install
}

