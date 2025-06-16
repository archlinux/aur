# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=garagejam
pkgver=5.0.0
pkgrel=1
pkgdesc="GarageJam is Free Software in development for musicians who want to compose, record and share original music to the Internet from the GNOME Desktop."
arch=('x86_64')
url="https://wiki.gnome.org/Apps/GarageJam"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib' 'geocode-glib-2' 'gobject-introspection' 'gstreamer' 'libxml2' 'vorbis-tools' 'pango' 'gtk3')
makedepends=('intltool' 'itstool' 'python')
source=( http://www.garagejam.org/src/garagejam-5.0.0.tar.xz)
sha256sums=('1c34d137b120535e13afccfb668dea1d6891dda131de47f1630ce4329c302f22')

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

