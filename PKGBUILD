# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sortpuz  
pkgver=1.8
pkgrel=2
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('ac8077b5e90f8d313c32413a82bbd1ecaa0570d434b3eb1ce8961ae416586e61')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/sortpuz/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
