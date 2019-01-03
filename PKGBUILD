# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.8
pkgrel=3
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.net/ukopp/ukopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('7de4442ee381ab047aff17ec0743c51be4aceb451ded20b9eedc4fb1e698b73e')
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
