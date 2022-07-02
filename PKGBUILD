# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=galaxy2
pkgver=1.8
pkgrel=4
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('0aff6bc740384653568f78f29240818d4f7421dfbc5b52612532e5a8ef2db75b')
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
