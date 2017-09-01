# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=17.08.3
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('mashup: for composing pages to print from within fotoxx' 
	    'rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha512sums=('5521572a43d9b3946a990d3d07bde3ba0fb954dca0a9a190aeb99b93156a8c0aa85e81ef8512cf8233e1555be50412944a5c11f4def86a34789c5d778853f690')
options=('!makeflags')

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
