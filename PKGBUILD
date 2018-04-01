# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=2.8
pkgrel=3
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.net/picpuz/picpuz.html"
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('9cfad919a0a37ea87a9e1cd4ad19db1d33288d4b681caf97e5528df29c5aec64')

build() {
  cd $pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr LDFLAGS="-lpthread"
}

package() { 
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install
}
