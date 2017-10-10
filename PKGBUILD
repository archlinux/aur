# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-nno-nob
pkgver=1.1.0
pkgrel=1
pkgdesc="Apertium language data for the Norwegian Nynorsk-Norwegian Bokmål translator."
url="http://wiki.apertium.org/wiki/Norwegian_Nynorsk_and_Norwegian_Bokmål"
license=('GPL')
makedepends=('pkgconfig')
depends=('apertium>=3.4.2' 'vislcg3>=0.9.7.6010' 'apertium-nno>=0.9.0' 'apertium-nob>=0.9.0')
replaces=('apertium-nn-nb')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz")
md5sums=('7c713c57171bd5aaa8e118b83f460507')
sha256sums=('0d4014281e9a4cef76ce86229f5080de114a1296e8f9ecb6ef5f2ce2c509eb89')

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
