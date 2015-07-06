# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=midimon
pkgver=0.3
pkgrel=1
pkgdesc="Basic MIDI monitor, works w/ JACK or ALSA MIDI drivers"
arch=('i686' 'x86_64')
url="http://midimon.sourceforge.net/"
license=('GPL')
depends=('libglademm' 'lash')
source=(http://downloads.sourceforge.net/midimon/$pkgname-$pkgver.tar.gz)
md5sums=('dcfd9d135768438f67fab0322a2636f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  sed -i 28i\#include\ \<stdio.h\> src/mm_lash.cc
  sed -i 27i\#include\ \<stdio.h\> src/mm_signal.cc
  sed -i 's/\/doc\/midimon/\/share\/doc\/midimon/' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:


