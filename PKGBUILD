# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-audio-locator
pkgver=3.0.0
pkgrel=1
pkgdesc="Live Audio Recording Software"
arch=('x86_64')
url="https://www.aamot.io/software/gnomeaudio/"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.aamot.io/software/gnomeaudio/src/gnome-audio-locator-3.0.0.tar.xz)
sha256sums=('0a5e6746dc79c854731d310ed3895e80f1555c67a9fd2bfc77a5522708cf6120')

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
