# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.4.0
pkgrel=1
pkgdesc="Language-independent machine translation engine and tools to manage language data."
url="http://apertium.org"
license=('GPL2')
makedepends=('pkgconfig' 'flex')
depends=('lttoolbox>=3.3.1' 'pcre' 'gawk' 'expat' 'libxslt')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/apertium-${pkgver}.tar.gz)
md5sums=('5aa356d4840d6ffb1490a3b6639930bd')
sha256sums=('2bd7f44b794615ebca1c5d3949b2139b665e2a5af24c40931ea0856e268fc3da')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
