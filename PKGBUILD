# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.7
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/ukopp/ukopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('854fbf3f72261eb337528382faaa5ca0c9a3260f957fa0725c811e802acca2d8')
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
