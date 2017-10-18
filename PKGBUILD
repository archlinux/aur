# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.5.9
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://jcupitt.github.io/libvips/"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif')
optdepends=('python2: vipsprofile')
# less used depends: 'libwebp' 'cfitsio'
# optional makedepends: 'v4l-utils' 'python2'
# minimal depends: 'libxml2'
options=('!libtool')
source=("https://github.com/jcupitt/libvips/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5e2bc42074be92606e4c6f50c816c18a7df0046bc5243fd459c95ca28f7a4e15')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
