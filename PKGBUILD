# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=0.0.5
pkgrel=1
pkgdesc="Record Audio with GNOME Voice"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4d672ccdaffc5d6b272851b51cb1aa98c5078b191c2b6770a28c175b0c5ae79e')

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

