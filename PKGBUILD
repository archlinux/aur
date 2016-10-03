# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=corebird
pkgver=1.3.3
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/baedert/corebird"
depends=('gtk3>=3.14'
     'glib2>=2.40'
     'rest>=0.7'
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
	 'librsvg')
makedepends=('vala>=0.28' 'automake')
source=(https://github.com/baedert/corebird/archive/${pkgver}.tar.gz)
sha1sums=('d7deeefe7293cbc8df1e6c17aae2197fe05f0d48')
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
