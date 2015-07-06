# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Sodium
pkgver=20150201
pkgrel=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/$pkgname-${_codename}-$pkgver.tar.gz")
md5sums=('7719bccdd319523da508e818e8e34fee')
sha1sums=('71c7d9ea6d36a82d78069081f64db7209aa2a40f')
sha256sums=('5875d86b0c269d348afa4602f0ca7fe6b6856191fdb703d8eb0bc90d4c985a7d')

build() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_codename-$pkgver"
  make DESTDIR="$pkgdir" install
}

