# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.3.3
pkgrel=1
pkgdesc="Handles lexical processing, morphological analysis and generation of words in natural languages using fast finite state transducers."
url="http://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL')
makedepends=('pkgconfig')
depends=('libxml2' 'gcc-libs')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/lttoolbox-${pkgver}.tar.gz)
md5sums=('0bfac9f5ae0f8769a75b18c3fdff827f')
sha256sums=('5ccfc98bd71e1c9cbb952f3b01a6f615cf580f39ce74cdcb7221fc9b48f40617')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
