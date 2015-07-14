# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-ca-it
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium language data for the Catalan-Italian translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2' 'apertium>=3.2')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz")
md5sums=('08b3d5a949ddce7fc8b3539490ef11f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PATH="/usr/bin:${PATH}" # override /usr/local/bin
  ./configure --prefix=/usr && make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
