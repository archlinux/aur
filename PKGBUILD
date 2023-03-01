# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sortpuz  
pkgver=2.0
pkgrel=6
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('d9f32e466d813776894bac91f58e8cad2a0d3a63d406696adfdc869b97c4a55d')
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
