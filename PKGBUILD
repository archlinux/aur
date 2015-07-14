# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-br-fr
pkgver=0.5.0
pkgrel=1
pkgdesc="Apertium language data for the Breton-French translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2' 'apertium>=3.2' 'vislcg3>=0.9.7.7823')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz")
md5sums=('65992f979f243e1f6a0f0b850b5a8a10')

build() {
  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  export PATH="/usr/bin:${PATH}" # override /usr/local/bin
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
