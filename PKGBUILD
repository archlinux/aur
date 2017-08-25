# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=corebird
pkgver=1.6
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://corebird.baedert.org/"
depends=('gtk3>=3.20'
     'gettext>=0.19.7'
     'glib2>=2.44'
     'sqlite3'
	 'libtool'
     'libsoup>=2.4'
     'json-glib'
     'intltool>=0.40'
     'gstreamer>=1.6'
     'gst-plugins-base'
     'gst-plugins-good'
     'gst-plugins-bad'
     'gst-libav'
     'gspell>=1.0'
     'librsvg')
makedepends=('vala>=0.28' 'automake')
source=(https://github.com/baedert/corebird/archive/${pkgver}.tar.gz)
sha1sums=('fd6423581764f9ec0e8949906f9d4537f03b6490')
conflicts=('corebird-git')

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
