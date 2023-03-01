# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=galaxy2
pkgver=1.8
pkgrel=5
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('ac70e77a5f888e1587b0ce126e5641f55ac9b01829dd2f08df2c601088cfef52')
options=('!emptydirs')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install  
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
  sed -i 's+/usr/share/galaxy2/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
