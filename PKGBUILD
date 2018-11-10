# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.7.0
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://jcupitt.github.io/libvips/"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif')
makedepends=('gtk-doc' 'gobject-introspection' 'swig')
optdepends=('python2: vipsprofile')
# less used depends: 'libwebp' 'cfitsio'
# optional makedepends: 'v4l-utils' 'python2'
# minimal depends: 'libxml2'
options=('!libtool')
source=("${pkgname}-${pkgver}::https://github.com/jcupitt/libvips/archive/v${pkgver}.tar.gz")
sha256sums=('79be1d48be6d7426ca41724f920ab6754721449b6bd4ec963ebc3fb4312216b4')

build() {
  cd "$srcdir"/libvips-$pkgver
  
  ./autogen.sh --prefix=/usr
  
  make
}

package() {
  cd "$srcdir"/libvips-$pkgver

  make DESTDIR="$pkgdir" install
}
