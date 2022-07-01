# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sortpuz  
pkgver=2.0
pkgrel=3
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('ff1cceeebdd6888ed5cd98e2706b8bcd19891cfd8249400d7ce0fe96ac67711b')
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
