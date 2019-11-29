# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp2
pkgver=1.1
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/ukopp/ukopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('75d0dd889098b6f5277ba4e7fabb4722')
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
