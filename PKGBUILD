# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=backwild
pkgver=2.3
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/backwild/backwild.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('d6fad12fe66f4cd2873cb14b6f5c0a9eb2dcfe311541d83331ce76fc6b5db543')
options=('!emptydirs')

build() {
  cd $pkgname
  export PREFIX=/usr
  make 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
}
