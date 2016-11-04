# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=titania
pkgver=2.0.1
pkgrel=2
pkgdesc="Use Titania to create standard complient X3D/VRML worlds for publishing on the World Wide Web and for creating stand alone applications"
arch=('i686' 'x86_64')
url="http://titania.create3000.de"
license=('GPL3')
groups=()
depends=('gtkmm3' 'gtksourceviewmm' 'glu' 'glew' 'mesa' 'mesa-libgl' 'js185' 'fontconfig' 'imagemagick' 'curl' 'openssl' 'sqlite' 'gstreamermm' 'zlib' 'libgtop' 'gettext' 'perl' 'perl-xml-libxml' 'glib-perl' 'perl-switch' 'cgal' 'gmp' 'mpfr' 'ttf-ubuntu-font-family')
makedepends=('make' 'gstreamer' 'gst-plugins-base' 'intltool' 'libtool')
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/create3000/titania/archive/titania-v2.1.0.tar.gz')
noextract=()
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  ../autogen.sh
  ../configure --prefix=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
