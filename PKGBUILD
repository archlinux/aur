# Contributor: Ross Gauchemann <hurrr@yahoo.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=a2png
pkgver=0.1.5
pkgrel=5
pkgdesc="Converts text into bitmap images such as PNG."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/a2png/files/"
license=('GPL2')
depends=('cairo')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('d3ae1c771f5180d93f35cded76d9bb4c4cc2023dbe65613e78add3eeb43f736b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
	      --with-cairo-include=/usr/include/cairo \
	      --with-cairo-lib=/usr/lib/
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

