# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.6
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.com/ukopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('a53fee7ecd9b6aa962d75cd14072fb97067dc48ce16cb97ece2acd1948ae3fa4')
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
