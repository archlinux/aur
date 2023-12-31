# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=garagejam
pkgver=1.0.0
pkgrel=1
pkgdesc="GarageJam is Free Software in development for musicians who want to compose, record and share original music to the Internet from the GNOME Desktop."
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Garagejam"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib' 'geocode-glib-2' 'gobject-introspection' 'gstreamer' 'libxml2' 'vorbis-tools' 'pango' 'gtk3')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.garagejam.org/src/garagejam-1.0.0.tar.xz)
sha256sums=('b7008972b167df451b6db9b4cf39b0576d70631f14563b70405cf8f113ed98af')

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

