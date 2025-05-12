# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-audio-locator
pkgver=4.0.0
pkgrel=1
pkgdesc="Live Audio Recording Software"
arch=('x86_64')
url="https://www.aamot.io/software/gnomeaudio/"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.aamot.io/software/gnomeaudio/src/gnome-audio-locator-4.0.0.tar.xz)
sha256sums=('7d1cf11a849d5d724e79c68914eb45fc4067846ac81b5c30d1559d291023604d')

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
