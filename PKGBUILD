# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=garagejam
pkgver=2.0.0
pkgrel=1
pkgdesc="GarageJam is Free Software in development for musicians who want to compose, record and share original music to the Internet from the GNOME Desktop."
arch=('x86_64')
url="https://wiki.gnome.org/Apps/GarageJam"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib' 'geocode-glib-2' 'gobject-introspection' 'gstreamer' 'libxml2' 'vorbis-tools' 'pango' 'gtk3')
makedepends=('intltool' 'itstool' 'python')
source=(https://www.garagejam.org/src/garagejam-2.0.0.tar.xz)
sha256sums=('66ebaa00c159466016aa54e18bc1b68c8bc11b680860676ce5292f42c5220e0a')

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

