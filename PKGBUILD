# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=0.3.0
pkgrel=1
pkgdesc="Voice is Public Voice Communication Software for GNOME 43 more information on on https://wiki.gnome.org/Apps/Voice and http://www.gnomevoice.org/"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Voice"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('c3c6f01f6bac93a4f6935c127ba644b31862dac80f337ef7a281c6eda11cdcde')

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

