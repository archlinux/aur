# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=0.0.2
pkgrel=1
pkgdesc="Record Audio with GNOME Voice"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('bc5300261738a64e51f59fbeb1bb25bf55f90c0346b6b9877c5985d09dbc8574')

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

