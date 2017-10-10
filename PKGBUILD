# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.4.2
pkgrel=1
pkgdesc="Language-independent machine translation engine and tools to manage language data."
url="http://apertium.org"
license=('GPL2')
makedepends=('pkgconfig' 'flex')
depends=('lttoolbox>=3.3.3' 'pcre' 'gawk' 'expat' 'libxslt')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/apertium-${pkgver}.tar.gz)
md5sums=('c739b10e0a69c43e98590b1c064bcf89')
sha256sums=('67b787c342cbd44d4bcafffdb5da3db265d4ce07003be21e73821c44102d7dd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
