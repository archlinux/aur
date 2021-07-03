# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=backwild
pkgver=2.1
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/backwild/backwild.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('6d29e32259922f7361c942426a9382503e5ce68ce84112efba8a445140b539a7')
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
