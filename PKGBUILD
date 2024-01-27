# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=8.0.0
pkgrel=1
pkgdesc="Voice is Public Voice Communication Software for GNOME 43 more information on on https://wiki.gnome.org/Apps/Voice and http://www.gnomevoice.org/"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Voice"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(http://www.gnomevoice.org/src/gnome-voice-8.0.0.tar.xz)
sha256sums=('285e7d148062648356e129a495636986d2ba9680b030f4fd1b74b39f61c008ca')

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

