# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sortpuz  
pkgver=2.0
pkgrel=2
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('538fbf1155fbff67b886a67ad94fe24476b1a5a7eed1a703c18f8c1d56f303cd')
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
