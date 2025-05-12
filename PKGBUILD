# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-audio-locator
pkgver=2.0.0
pkgrel=1
pkgdesc="Live Audio Recording Software"
arch=('x86_64')
url="https://www.aamot.io/software/gnomeaudio/"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.aamot.io/software/gnomeaudio/src/gnome-audio-locator-2.0.0.tar.xz)
sha256sums=('2942f9ed4d5c1ae78ee5934ef237f0ebe251c30bd6b0e99daebee4c8378356d3')

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
