# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp2
pkgver=1.5
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/ukopp/ukopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('d86f09bd1854b0b653d8463c42890a32923d0f94094040c3d90117a22424eb5f')
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
