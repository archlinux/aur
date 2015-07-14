# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.3.0
pkgrel=1
pkgdesc="Language-independent machine translation engine and tools to manage language data."
url="http://apertium.org"
license=('GPL2')
makedepends=('pkgconfig' 'flex')
depends=('lttoolbox>=3.2.0' 'pcre' 'gawk' 'expat' 'libxslt')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/apertium-${pkgver}.tar.gz)
md5sums=('d008c1a1365a740206b48ba3ea759547')
sha256sums=('9c2ff5b4f3cb99cd1b2f09c585fd86469ad32fb9d651ccd5c25c1848eca55a0d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
