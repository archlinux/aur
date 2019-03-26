# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sortpuz  
pkgver=1.5
pkgrel=8
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.com/sortpuz"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
conflicts=('fixme')
replaces=('fixme')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('7640f0ed19b26eb32d42f6d27f01cfbe2063c182c75b31db290a923b2c51365c')
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
