# Contributor: Ross Gauchemann <hurrr@yahoo.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=a2png
pkgver=0.1.5
pkgrel=3
pkgdesc="Converts text into bitmap images such as PNG."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/a2png/files/"
license=('GPL2')
depends=('cairo')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('2ccf851a8f0ac611a7bc83b35de0a727')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
	      --with-cairo-include=/usr/include/cairo \
	      --with-cairo-lib=/usr/lib/
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

