# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=garagejam
pkgver=4.0.0
pkgrel=1
pkgdesc="GarageJam is Free Software in development for musicians who want to compose, record and share original music to the Internet from the GNOME Desktop."
arch=('x86_64')
url="https://wiki.gnome.org/Apps/GarageJam"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib' 'geocode-glib-2' 'gobject-introspection' 'gstreamer' 'libxml2' 'vorbis-tools' 'pango' 'gtk3')
makedepends=('intltool' 'itstool' 'python')
source=( http://www.garagejam.org/src/garagejam-4.0.0.tar.xz)
sha256sums=('24fa1b126b1b2a39125a2f1a25ab58107047f373b13580d9c160f28e2e84009c')

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

