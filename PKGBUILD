# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.8
pkgrel=2
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/ukopp/ukopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('56eb70cda5f4d5c20937a3b484bcd85eca0ed145e0924ca53d7e090b11590665')
options=('!emptydirs')

build() {
  cd $pkgname
  export PREFIX=/usr
  make LDFLAGS="-lpthread"
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install
}
