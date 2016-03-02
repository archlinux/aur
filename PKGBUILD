# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Magnesium
pkgver=20151002
pkgrel=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${_codename}-${pkgver}.tar.gz")
md5sums=('b7d761bdf0a58f3f8ec4242a3b67d50a')
sha1sums=('5aa50a310bf35f9a4acc5931b0e3f119ff65eb71')
sha256sums=('161f65bd66ed5fe10205462d534d1b387ac727666cd974ccd49d14a50492681e')

build() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  make DESTDIR="$pkgdir" install
}

