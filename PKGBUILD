# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=19.0
pkgrel=10
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha512sums=('5e3c3e46565f915bbc2461e1b6ef4914c2117cf7e0d0d4005e3b70440c21a3ccfc575f8e72405c98f764619b3e65c4064d5043e3b32ce6b1f1eb4be751757817')
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
