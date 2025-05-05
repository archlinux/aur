# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=49.0
pkgrel=1
pkgdesc="Voice is Public Voice Communication Software for GNOME 48 more information on on https://wiki.gnome.org/Apps/Voice and http://www.gnomevoice.org/"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Voice"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(http://www.aamot.engineering/software/voice/www/src/gnome-voice-49.0.tar.xz)
sha256sums=('366fdee38d66da3b62ee115e2df9ab8e7cfb3fbf09a19141d6872f4214a33934')

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

