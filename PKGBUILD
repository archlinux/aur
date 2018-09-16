# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=19.0
pkgrel=5
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha512sums=('45642b85c4bbdcb8b3eb2f39c99bb58a9650790aead6fe2ec18a5b2ee86a7f3d044826100a8caefa7cf539ae9ad2833a5facf2a18f90e15eadaaffbacf0edb45')
options=('!makeflags')

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
