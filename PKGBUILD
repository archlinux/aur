# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-audio-locator
pkgver=1.0.0
pkgrel=1
pkgdesc="Live Audio Recording Software"
arch=('x86_64')
url="https://www.aamot.io/software/gnomeaudio/"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.aamot.io/software/gnomeaudio/src/gnome-audio-locator-1.0.0.tar.xz)
sha256sums=('8b1a0f67dc640cf9630b37042682463926553325a602dbd37249afbab574552c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-recording
  make
}

check(){
  cd $pkgname-$pkgver
  make check -k
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
