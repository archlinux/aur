# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=dino
pkgver=0.2.8
pkgrel=1
pkgdesc="A MIDI sequencer for GNU/Linux."
arch=('i686' 'x86_64')
url="http://dino.nongnu.org/"
license=('GPL')
depends=(libglademm libxml++ lash)
source=(http://download.savannah.nongnu.org/releases-noredirect/dino/$pkgname-$pkgver.tar.gz)
md5sums=('299d72ec0dbf66eb207bedf0bc19f9ee')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
} 
