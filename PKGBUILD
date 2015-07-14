# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.3.0
pkgrel=1
pkgdesc="Handles lexical processing, morphological analysis and generation of words in natural languages using fast finite state transducers."
url="http://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL')
makedepends=('pkgconfig')
depends=('libxml2' 'gcc-libs')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/lttoolbox-${pkgver}.tar.gz)
md5sums=('001144ffacd544695f5343691cec1824')
sha256sums=('b12cb16f286e87f15eea0e3e988c70e89183eaa6e46a517aff2a4260e52ed773')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
