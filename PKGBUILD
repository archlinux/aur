# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice
pkgver=0.0.4
pkgrel=1
pkgdesc="Record Audio with GNOME Voice"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('2c92a4acf3474c76758cead7469ed73b42f9352b9c949dd9febea36b05f39014')

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

