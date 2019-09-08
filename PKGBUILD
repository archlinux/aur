# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.8.2
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://libvips.github.io/libvips/"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif')
optdepends=('python2: vipsprofile')
# less used depends: 'libwebp' 'cfitsio'
# optional makedepends: 'v4l-utils' 'python2'
# minimal depends: 'libxml2'
options=('!libtool')
source=("https://github.com/libvips/libvips/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aba3f97d60c344c5d40ffcec524460e378dab939f873ec5d155bbc510a4fbd5d')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
