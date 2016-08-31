# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>

pkgname=ardesia
pkgver=1.1
pkgrel=1
pkgdesc="Free digital sketchpad to draw on the X11 session"
arch=('i686' 'x86_64')
url="https://code.google.com/p/ardesia/"
install="ardesia.install"
depends=('gtk3' 'gsl' 'libgsf' 'desktop-file-utils')
makedepends=('gcc' 'make' 'automake' 'autoconf' 'intltool' 'libtool' 'gtk3' 'atk' 'libx11' 'libpng' 'glib2' 'gconf' 'fontconfig' 'freetype2' 'gsl' 'libxml2' 'xdg-utils' 'libgsf')
license=('GPL3')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ardesia/ardesia-1.1.tar.gz")
md5sums=('b0abe145ce4ade50ab897ec658d2d664')
sha1sums=('2c0603cefe7bb33909787d030df5cd60cfee009f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh
  #./configure 

  make 
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
