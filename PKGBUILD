# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=backwild
pkgver=2.0
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/backwild/backwild.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('29ce7b801b0e3d31a5a45c387f9b660a4c96114a677785c064050ef43bec70eb')
options=('!emptydirs')

build() {
  cd $pkgname
  export PREFIX=/usr
  make 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/ukopp/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
