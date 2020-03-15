# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sortpuz  
pkgver=1.6
pkgrel=3
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.com/sortpuz"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
conflicts=('fixme')
replaces=('fixme')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('f992e6a1c4727e2eec51c6b9ebc6453bf67d4fed60acb0601badd6454057ef49')
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
