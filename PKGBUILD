pkgname=corebird
pkgver=1.0
pkgrel=2
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
     'gstreamer'
     'gst-plugins-good'
     'gst-plugins-bad'
     'gst-libav'
	 'librsvg')
makedepends=('vala>=0.26' 'automake')
source=(https://github.com/baedert/corebird/archive/${pkgver}.tar.gz)
sha1sums=('eac706c75474704b4c4f321a7dfede13f45dbf71')
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
