# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-nob
pkgver=0.9.0
pkgrel=1
pkgdesc="Apertium language data for Norwegian Bokmål"
url="http://wiki.apertium.org/wiki/Norwegian_Nynorsk_and_Norwegian_Bokmål"
license=('GPL')
makedepends=('pkgconfig')
depends=('apertium>=3.4.2' 'vislcg3>=0.9.7.6010')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz")
md5sums=('9f3d8636111f9b79ed62461200758085')
sha256sums=('07277e50f0d0f0ce1356455673a6075dd3b496488d12514d1fabce9a80c3dca9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
