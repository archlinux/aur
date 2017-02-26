# Contributor: Ross Gauchemann <hurrr@yahoo.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=a2png
pkgver=0.1.5
pkgrel=4
pkgdesc="Converts text into bitmap images such as PNG."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/a2png/files/"
license=('GPL2')
depends=('cairo')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('a3f3c994e9bc2161c6946a0f17b0d327b80067c4171b09f5d696004329eabf862c26220e9e4f48b4e16af59890f54c7c43191adf387fd3d8b4468355ab1789ce')

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

