# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.5.7
pkgrel=2
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
sha256sums=('a6c70794a240c64dbaa0b03902d25f1f82fd2d4d657878df901f1fc98bf77bf1')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
