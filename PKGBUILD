# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=0.0.6
pkgrel=1
pkgdesc="Record Audio with GNOME Voice"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1a58d20efc03c0eb9a7b540de93846b87d14eeb56908f74f61a53f1bd65d5dd7')

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

