# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=19.4
pkgrel=2
pkgdesc="A program for improving image files made with a digital camera, stable version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha512sums=('2beb8e38c992d9da18307c2158f1a956ba5c916fde54c9e12737596310e3352e8122f232cd9cce6e489cfef107aa33dfc84cfa1f437f2c17caf8b68c5a0e60a1')

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
  chmod o+r "$pkgdir"/usr/share/fotoxx/images/show-RGB.jpg
}
