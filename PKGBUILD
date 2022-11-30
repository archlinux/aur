# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: zoe <chp321@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=kmidimon
pkgver=1.3.1
pkgrel=2
pkgdesc="Drumstick MIDI Monitor (kmidimon) is a MIDI monitor for Linux using ALSA sequencer and Qt5 user interface."
arch=('i686' 'x86_64')
url="https://kmidimon.sourceforge.io/"
license=('GPL')
depends=('alsa-lib' 'drumstick')
makedepends=('cmake' 'qt6-tools'  'qt6-5compat')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2d81b27410beabfda1a4e2502c3428ca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_DOCS=OFF -DCMAKE_BUILD_TYPE=Release
          
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
