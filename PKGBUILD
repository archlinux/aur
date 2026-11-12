# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=51.0
pkgrel=1
pkgdesc="Voice is Public Voice Communication Software for GNOME 48 more information on on https://wiki.gnome.org/Apps/Voice and http://www.gnomevoice.org/"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Voice"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.gnomevoice.org/src/gnome-voice-51.0.tar.gz)
sha256sums=('16412c9f5006eb4cc6af188ff1ebf23c2c1cda1eacc18b70840baaee2f3bc29e')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
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

