# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=corebird
pkgver=1.2
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/baedert/corebird"
depends=('gtk3>=3.14'
     'glib2>=2.40'
     'rest>=0.7'
     'libgee>=0.8'
     'sqlite3'
	 'libtool'
     'libsoup>=2.4'
     'json-glib'
     'intltool>=0.40'
     'gstreamer>=1.6'
     'gst-plugins-good'
     'gst-plugins-bad'
     'gst-libav'
	 'librsvg')
makedepends=('vala>=0.28' 'automake')
source=(https://github.com/baedert/corebird/archive/${pkgver}.tar.gz)
sha1sums=('8f498b39ba920bd1fb42dac90ced600c5a6e50a5')
install=corebird.install

build() {
  cd corebird-${pkgver}
  # Add --disable-video here if you don't like the gstreamer deps
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd corebird-${pkgver}
  make DESTDIR=$pkgdir install
}
