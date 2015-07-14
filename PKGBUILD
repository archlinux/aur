# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.3.1
pkgrel=1
pkgdesc="Handles lexical processing, morphological analysis and generation of words in natural languages using fast finite state transducers."
url="http://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL')
makedepends=('pkgconfig')
depends=('libxml2' 'gcc-libs')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/lttoolbox-${pkgver}.tar.gz)
md5sums=('d50479b2376a4839b7acac352505623e')
sha256sums=('55eaa1159951d783bb5b42f32fb94727fa19303b7409b720a26a2c5260fbec36')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
