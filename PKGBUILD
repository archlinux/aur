# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=backwild
pkgver=2.4
pkgrel=2
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/backwild/backwild.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('927a8f91059e767a5a93599695a43c5ebee2a6e7af6ac10f5773ca5d98e4f401')
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
