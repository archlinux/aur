# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.8
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/ukopp/ukopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('e10cc04cdc4293786fcab9648f4344b94685088e850005089649b0474a990e90')
options=('!emptydirs')

build() {
  cd $pkgname-$pkgver
  export PREFIX=/usr
  make LDFLAGS="-lpthread"
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install
}
