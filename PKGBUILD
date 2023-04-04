# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=backwild
pkgver=2.4
pkgrel=6
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/backwild/backwild.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('47775e21e62a0ecc731abc8cb62940de618b67a6e37961bb9800de37b9be06bb')
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
