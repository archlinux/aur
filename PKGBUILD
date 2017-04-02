# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=2.8
pkgrel=1
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.com/picpuz/"
license=('GPL3')
depends=('gtk3')
makedepends=('pkgconfig')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('6ae07ffc875fb2b6e53b492e7da6cdb4')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr LDFLAGS="-lpthread"
}

package() { 
  cd $srcdir/$pkgname-$pkgver
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR=$pkgdir install
}
